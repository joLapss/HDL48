/********************************************************************************************************

 Company: École de technologie supérieur
 Engineer:
 		Kevin Parent Legault
		Jonathan Lapointe
 Create Date:  2015-05-26
 Module Name: main.c
 Project Name: lab2n
 Target Devices: Altera cyclone V SOPC
 Tool versions: NIOS II v14.1
 Description:
	

 Revision: v1
 Revision 0.01 - File Created
 Additional Comments:


*********************************************************************************************************/

//Function declaration

/*
 * @fn 	 écrire fonction
 * @des  écrire description
 * @arg  écrire les arguments
 * @ret  écrire le retour de fonction
 */
#include "hardware.h"
#include "jtagUart.h"
#include "system.h"
#include "altera_up_avalon_video_pixel_buffer_dma.h"
#include "altera_up_avalon_video_character_buffer_with_dma.h"
#include "altera_up_avalon_video_character_buffer_with_dma_regs.h"
#include "sys/alt_sys_init.h"




int main(void)
{


	U8 i=0;
	U16 j=0;

	U16 color;
	char text_top_row[40] = "Altera DE2\0";
	//alt_sys_init();

	alt_up_pixel_buffer_dma_dev* pixelPTR=alt_up_pixel_buffer_dma_open_dev(PIXEL_BUFFER_NAME);
	alt_up_char_buffer_dev* charbuff = alt_up_char_buffer_open_dev("/dev/character_buffer");
	if(&charbuff == 0)
		jUartSendString("Device Not Found");
	else
		jUartSendString("Device Found");
	alt_up_pixel_buffer_dma_clear_screen(pixelPTR,0);
	alt_up_pixel_buffer_dma_draw_box(pixelPTR,0, 0, 339, 239, 0x187F, 0);
//	if(alt_up_pixel_buffer_dma_draw(pixelPTR,0xffff,200,200)==0)
//		jUartSendString("suceess");
//	else
//		jUartSendString("failed");

	alt_up_char_buffer_clear(charbuff);
	alt_up_char_buffer_string(charbuff, text_top_row,10, 20);

	for(;;)
	{
//		for(j=0;j<255;j++);
//		//alt_up_char_buffer_clear(charbuff);
//		alt_up_char_buffer_draw(charbuff,'A', i,  20);
//		alt_up_char_buffer_draw(charbuff,' ', i-1,  20);





		//i++;
//		color++;
//		alt_up_char_buffer_string(charbuff, "ALLO",20, i);
//		if(alt_up_pixel_buffer_dma_draw(pixelPTR,color,i,i)==0)
//				jUartSendString("suceess");
//			else
//				jUartSendString("failed");
	}
return 0;
}
