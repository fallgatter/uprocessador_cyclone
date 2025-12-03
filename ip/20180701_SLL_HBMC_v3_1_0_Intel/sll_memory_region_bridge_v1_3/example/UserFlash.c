#include <stdio.h>
#include <system.h>
#include <alt_types.h>
#include <sys/alt_sys_init.h>
#include <sys/alt_flash.h>

#define HYPERFLASH_DATA_NAME "/dev/HyperFlash_iavsf"

// Function Prototypes for accessing the flash
void WriteByte(alt_flash_fd * fd, flash_region region, int block, int offset, alt_u8 data);
alt_u8 ReadByte(alt_flash_fd * fd, flash_region region, int block, int offset);
void EraseBlock(alt_flash_fd * fd, flash_region region, int block);

// Helper functions for the user interface
void DisplayMainMenu(alt_flash_fd * fd);
void DisplayWriteMenu(alt_flash_fd * fd);
void DisplayReadMenu(alt_flash_fd * fd);
void DisplayEraseMenu(alt_flash_fd * fd);
flash_region AskForRegion(alt_flash_fd * fd);
int AskForBlock(flash_region region);
int AskForOffset(flash_region region);

int main()
{
	alt_flash_fd * fd;	// File descriptor to access onchip flash device

	// Open up the flash device so we can write to it
	fd = alt_flash_open_dev(HYPERFLASH_DATA_NAME);

	if(fd != NULL)
	{
		// Main Menu loop
		DisplayMainMenu(fd);

		// Close the flash device
		alt_flash_close_dev(fd);
	}
	else
	printf("Unable to open flash device.\n");

	printf("End of program\n");

	// Dummy infinite loop
	while(1);

	return 0;
}

/**
 * Writes a single byte to the specified region and offset
 * without destroying the other data in the page. It does this
 * by performing a read-modify-write operation on the flash page.
 *
 * This function does not perform error checking on the addresses
 * being passed in and is assumed to have a valid region/offset passed in.
 *
 * @param	fd		A file descriptor to the internal flash memory
 * @param	region	The sector/region to write to
 * @param	block	The page/block within the sector to write to
 * @param	offset	The byte offset within the page/block to write to
 * @param	data	The data to write to the page/block
 */
void WriteByte(alt_flash_fd * fd, flash_region region, int block, int offset, alt_u8 data)
{
	int ret_code = 0;

  alt_u8 *read_buffer;
 
  /* Get a couple buffers for the tests */
  read_buffer = malloc(region.block_size);
 
  
	// Read the to-be-erased page/block into a buffer
	ret_code = alt_read_flash(fd, region.offset + (block * region.block_size), read_buffer, region.block_size);

	// If we successfully read the flash data
	if(ret_code == 0)
	{
		// Modify the buffer with the data
		*(read_buffer + offset) = data;

		// Erase the page and write the modified data back to it
		ret_code = alt_write_flash(fd, region.offset + (block * region.block_size), read_buffer, region.block_size);

		if(ret_code != 0)
			printf("Couldn't write page of modified data.\n");
		else
			printf("\nData written at offset 0x%x successfully\n", region.offset + (block * region.block_size) + offset);
	}
	else
		printf("Couldn't read page of data before writing.\n");
}

/**
 * Reads a single byte from the specified region and offset.
 *
 * @param	fd		A file descriptor to the internal flash memory
 * @param	region	The sector/region to read from
 * @param	block	The page/block within the sector to read from
 * @param	offset	The byte offset within the page/block to read from
 */
alt_u8 ReadByte(alt_flash_fd * fd, flash_region region, int block, int offset)
{
	int ret_code = 0;

	// Data that was from flash
	alt_u8 data = 0;

	// Read a single byte of data
	ret_code = alt_read_flash(fd, region.offset + (block * region.block_size) + offset, &data, 1);

	// If we failed to read the flash data
	if(ret_code != 0)
		printf("Couldn't read data from flash.\n");
	else
		printf("\nData read at offset 0x%x: %d\n", region.offset + (block * region.block_size) + offset, data);

	return data;
}

/**
 * Erases a single page/block from the specified region.
 *
 * @param	fd		A file descriptor to the internal flash memory
 * @param	region	The sector/region to erase from
 * @param	block	The page/block within the sector to erase
 */
void EraseBlock(alt_flash_fd * fd, flash_region region, int block)
{
	int ret_code = 0;

	// Read a single byte of data
	ret_code = alt_erase_flash_block(fd, region.offset + (block * region.block_size), region.block_size);

	// If we failed to erase the flash data
	if(ret_code != 0)
		printf("Couldn't erase data from flash.\n");
	else
		printf("Erased block successfully.\n");
}

void DisplayMainMenu(alt_flash_fd * fd)
{
	int menu_option = 0;
	do
	{
		printf("\nPlease select a menu option:\n");
		printf("0. Write a byte\n");
		printf("1. Read a byte\n");
		printf("2. Erase a page/block\n");
		printf("\nEnter a menu option: ");
		scanf("%d", &menu_option);

		if(menu_option == 0)
			DisplayWriteMenu(fd);
		else if(menu_option == 1)
			DisplayReadMenu(fd);
		else if(menu_option == 2)
			DisplayEraseMenu(fd);
		else
			printf("Invalid menu option. Please try again.\n");
	} while(1);
}

void DisplayWriteMenu(alt_flash_fd * fd)
{
	flash_region region;
	int block, offset;
	int data = 0;

	region = AskForRegion(fd);
	block = AskForBlock(region);
	offset = AskForOffset(region);

	printf("\nWhat data would you like to write: ");
	scanf("%d", &data);

	WriteByte(fd, region, block, offset, (alt_u8)data);
}

void DisplayReadMenu(alt_flash_fd * fd)
{
	flash_region region;
	int block, offset;

	region = AskForRegion(fd);
	block = AskForBlock(region);
	offset = AskForOffset(region);

	ReadByte(fd, region, block, offset);
}

void DisplayEraseMenu(alt_flash_fd * fd)
{
	flash_region region;
	int block;

	region = AskForRegion(fd);
	block = AskForBlock(region);

	EraseBlock(fd, region, block);
}

flash_region AskForRegion(alt_flash_fd * fd)
{
	int i = 0;
	int menu_option = 0;

	// Variables for determining available regions at runtime
	flash_region * regions;
	int num_regions;

	// Dynamically determine what regions/sectors are available and how big they are
	alt_get_flash_info(fd, &regions, &num_regions);

	do
	{
		printf("\n-----Available Regions/Sectors-----\n");
		for(i = 0; i < num_regions; ++i)
			printf("%d. Region %d (0x%x - 0x%x)\n", i, i, regions[i].offset, regions[i].offset + regions[i].region_size - 1);

		printf("Which region would you like to access: ");
		scanf("%d", &menu_option);

		if(menu_option < 0 || menu_option >= num_regions)
			printf("Invalid menu option. Please try again.\n");

	} while(menu_option < 0 || menu_option >= num_regions);

	return regions[menu_option];
}

int AskForBlock(flash_region region)
{
	int menu_option = 0;

	do
	{
		printf("\nWhich page/block would you like to access (0-%d): ", region.number_of_blocks - 1);
		scanf("%d", &menu_option);

		if(menu_option < 0 || menu_option >= region.number_of_blocks)
			printf("Invalid menu option. Please try again.\n");

	} while(menu_option < 0 || menu_option >= region.number_of_blocks);

	return menu_option;
}

int AskForOffset(flash_region region)
{
	int menu_option = 0;

	do
	{
		printf("\nWhat byte within the page/block would you like to access (0-%d): ", region.block_size - 1);
		scanf("%d", &menu_option);

		if(menu_option < 0 || menu_option >= region.block_size)
			printf("Invalid menu option. Please try again.\n");

	} while(menu_option < 0 || menu_option >= region.block_size);

	return menu_option;
}
