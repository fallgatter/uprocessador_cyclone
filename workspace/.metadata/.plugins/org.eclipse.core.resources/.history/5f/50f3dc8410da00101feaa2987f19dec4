#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "includes.h"
#include "simple_socket_server.h"
#include "alt_error_handler.h"
#include "ipport.h"
#include "tcpport.h"
#include "libport.h"
#include "osport.h"
#include <io.h>

// Endereços dos registradores User_HW
#define ADDR_CONTROL 0
#define ADDR_DATA    1
#define ADDR_RAM     2
#define ADDR_STEP    3

int main() {
	int instr;

	instr = 0b00000000000000001; //LD R0,0

	IOWR(USERHW_0_BASE, ADDR_DATA, instr); //carrega instrução no reg de dados
	IOWR(USERHW_0_BASE, ADDR_CONTROL, 2);  //end_ram vai receber writedata
	IOWR(USERHW_0_BASE, ADDR_RAM, 0); 	   //end_ram = 0

	instr = 0b00000001001110010; //MOV A,R0

	IOWR(USERHW_0_BASE, ADDR_DATA, instr); //carrega instrução no reg de dados
	IOWR(USERHW_0_BASE, ADDR_CONTROL, 2);  //end_ram vai receber writedata
	IOWR(USERHW_0_BASE, ADDR_RAM, 0); 	   //end_ram = 0

	IOWR(USERHW_0_BASE, ADDR_CONTROL, 4);  //run
	while(1){}
	return 0;
}
