# +----------------------------------------------------------------------------+
# | License Agreement                                                          |
# |                                                                            |
# | Copyright (c) 1991-2014 Altera Corporation, San Jose, California, USA.     |
# | All rights reserved.                                                       |
# |                                                                            |
# | Any megafunction design, and related net list (encrypted or decrypted),    |
# |  support information, device programming or simulation file, and any other |
# |  associated documentation or information provided by Altera or a partner   |
# |  under Altera's Megafunction Partnership Program may be used only to       |
# |  program PLD devices (but not masked PLD devices) from Altera.  Any other  |
# |  use of such megafunction design, net list, support information, device    |
# |  programming or simulation file, or any other related documentation or     |
# |  information is prohibited for any other purpose, including, but not       |
# |  limited to modification, reverse engineering, de-compiling, or use with   |
# |  any other silicon devices, unless such use is explicitly licensed under   |
# |  a separate agreement with Altera or a megafunction partner.  Title to     |
# |  the intellectual property, including patents, copyrights, trademarks,     |
# |  trade secrets, or maskworks, embodied in any such megafunction design,    |
# |  net list, support information, device programming or simulation file, or  |
# |  any other related documentation or information provided by Altera or a    |
# |  megafunction partner, remains with Altera, the megafunction partner, or   |
# |  their respective licensors.  No other licenses, including any licenses    |
# |  needed under any third party's intellectual property, are provided herein.|
# |  Copying or modifying any file, or portion thereof, to which this notice   |
# |  is attached violates this copyright.                                      |
# |                                                                            |
# | THIS FILE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR    |
# | IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,   |
# | FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL    |
# | THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER |
# | LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING    |
# | FROM, OUT OF OR IN CONNECTION WITH THIS FILE OR THE USE OR OTHER DEALINGS  |
# | IN THIS FILE.                                                              |
# |                                                                            |
# | This agreement shall be governed in all respects by the laws of the State  |
# |  of California and by the laws of the United States of America.            |
# |                                                                            |
# +----------------------------------------------------------------------------+

# TCL File Generated by Altera University Program
# DO NOT MODIFY

# +-----------------------------------
# | module altera_up_avalon_video_stream_router
# | 
set_module_property DESCRIPTION "Video-Stream Router for DE-series Boards"
set_module_property NAME altera_up_avalon_video_stream_router
set_module_property VERSION 14.0
set_module_property GROUP "University Program/Audio & Video/Video"
set_module_property AUTHOR "Altera University Program"
set_module_property DISPLAY_NAME "Video-Stream Router"
set_module_property DATASHEET_URL "[pwd]/../doc/Video.pdf"
#set_module_property TOP_LEVEL_HDL_FILE altera_up_avalon_video_stream_router.v
#set_module_property TOP_LEVEL_HDL_MODULE altera_up_avalon_video_stream_router
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property HIDE_FROM_QUARTUS true
set_module_property EDITABLE false
set_module_property ANALYZE_HDL false
set_module_property ELABORATION_CALLBACK elaborate
set_module_property GENERATION_CALLBACK generate
# | 
# +-----------------------------------

# +-----------------------------------
# | files
# | 
#add_file altera_up_avalon_video_stream_router.v {SYNTHESIS SIMULATION}
# | 
# +-----------------------------------

# +-----------------------------------
# | parameters
# | 
add_parameter router_type string "Merge"
set_parameter_property router_type DISPLAY_NAME "Stream Router Type"
set_parameter_property router_type GROUP "Mode"
set_parameter_property router_type UNITS None
set_parameter_property router_type AFFECTS_ELABORATION true
set_parameter_property router_type AFFECTS_GENERATION true
set_parameter_property router_type ALLOWED_RANGES {"Split" "Merge"}
set_parameter_property router_type VISIBLE true
set_parameter_property router_type ENABLED true

add_parameter sync boolean "false"
set_parameter_property sync DISPLAY_NAME "Enable Synchronization Stream"
set_parameter_property sync GROUP "Mode"
set_parameter_property sync UNITS None
set_parameter_property sync AFFECTS_ELABORATION true
set_parameter_property sync AFFECTS_GENERATION true
set_parameter_property sync VISIBLE true
set_parameter_property sync ENABLED true

add_parameter color_bits positive "8"
set_parameter_property color_bits DISPLAY_NAME "Color Bits"
set_parameter_property color_bits GROUP "Pixel Format"
set_parameter_property color_bits UNITS None
set_parameter_property color_bits AFFECTS_ELABORATION true
set_parameter_property color_bits AFFECTS_GENERATION true
set_parameter_property color_bits VISIBLE true
set_parameter_property color_bits ENABLED true

add_parameter color_planes positive "1"
set_parameter_property color_planes DISPLAY_NAME "Color Planes"
set_parameter_property color_planes GROUP "Pixel Format"
set_parameter_property color_planes UNITS None
set_parameter_property color_planes AFFECTS_ELABORATION true
set_parameter_property color_planes AFFECTS_GENERATION true
set_parameter_property color_planes ALLOWED_RANGES {1 2 3 4}
set_parameter_property color_planes VISIBLE true
set_parameter_property color_planes ENABLED true
# | 
# +-----------------------------------

# +-----------------------------------
# | connection point clk
# | 
add_interface clk clock end
set_interface_property clk enabled true

add_interface_port clk clk clk Input 1
# | 
# +-----------------------------------

# +-----------------------------------
# | connection point reset
# | 
add_interface reset reset end
set_interface_property reset associatedClock clk
set_interface_property reset enabled true
set_interface_property reset synchronousEdges DEASSERT

add_interface_port reset reset reset Input 1
# | 
# +-----------------------------------

# +-----------------------------------
# | Elaboration function
# | 
proc elaborate {} {
	set router_type		[ get_parameter_value "router_type" ]
	set sync			[ get_parameter_value "sync" ]
	set color_bits		[ get_parameter_value "color_bits" ]
	set color_planes	[ get_parameter_value "color_planes" ]

	set dw [ expr $color_bits * $color_planes ]
	if { ($color_planes == 4) || ($color_planes == 3) } {
		set ew 2
	} else {
		set ew 1
	}

	if { $router_type == "Split" } {
		# +-----------------------------------
		# | connection point avalon_stream_router_sink
		# | 
		add_interface avalon_stream_router_sink avalon_streaming end
		set_interface_property avalon_stream_router_sink associatedClock clk
		set_interface_property avalon_stream_router_sink associatedReset reset
		set_interface_property avalon_stream_router_sink dataBitsPerSymbol $color_bits
		set_interface_property avalon_stream_router_sink errorDescriptor ""
		set_interface_property avalon_stream_router_sink maxChannel 0
		set_interface_property avalon_stream_router_sink readyLatency 0
		set_interface_property avalon_stream_router_sink symbolsPerBeat $color_planes

		add_interface_port avalon_stream_router_sink stream_in_data data Input $dw 
		add_interface_port avalon_stream_router_sink stream_in_startofpacket startofpacket Input 1
		add_interface_port avalon_stream_router_sink stream_in_endofpacket endofpacket Input 1
#		add_interface_port avalon_stream_router_sink stream_in_empty empty Input $ew
		add_interface_port avalon_stream_router_sink stream_in_valid valid Input 1
		add_interface_port avalon_stream_router_sink stream_in_ready ready Output 1
		# | 
		# +-----------------------------------

		if { $sync } {
			# +-----------------------------------
			# | connection point avalon_sync_source
			# | 
			add_interface avalon_sync_source avalon_streaming start
			set_interface_property avalon_sync_source associatedClock clk
			set_interface_property avalon_sync_source associatedReset reset
			set_interface_property avalon_sync_source dataBitsPerSymbol 1
			set_interface_property avalon_sync_source errorDescriptor ""
			set_interface_property avalon_sync_source maxChannel 0
			set_interface_property avalon_sync_source readyLatency 0
			set_interface_property avalon_sync_source symbolsPerBeat 1

			add_interface_port avalon_sync_source sync_ready ready Input 1
			add_interface_port avalon_sync_source sync_data data Output 1
			add_interface_port avalon_sync_source sync_valid valid Output 1
			# | 
			# +-----------------------------------
		}

		# +-----------------------------------
		# | connection point avalon_stream_router_source_0
		# | 
		add_interface avalon_stream_router_source_0 avalon_streaming start
		set_interface_property avalon_stream_router_source_0 associatedClock clk
		set_interface_property avalon_stream_router_source_0 associatedReset reset
		set_interface_property avalon_stream_router_source_0 dataBitsPerSymbol $color_bits
		set_interface_property avalon_stream_router_source_0 errorDescriptor ""
		set_interface_property avalon_stream_router_source_0 maxChannel 0
		set_interface_property avalon_stream_router_source_0 readyLatency 0
		set_interface_property avalon_stream_router_source_0 symbolsPerBeat $color_planes

		add_interface_port avalon_stream_router_source_0 stream_out_ready_0 ready Input 1
		add_interface_port avalon_stream_router_source_0 stream_out_data_0 data Output $dw
		add_interface_port avalon_stream_router_source_0 stream_out_startofpacket_0 startofpacket Output 1
		add_interface_port avalon_stream_router_source_0 stream_out_endofpacket_0 endofpacket Output 1
#		add_interface_port avalon_stream_router_source_0 stream_out_empty_0 empty Output $ew
		add_interface_port avalon_stream_router_source_0 stream_out_valid_0 valid Output 1
		# | 
		# +-----------------------------------

		# +-----------------------------------
		# | connection point avalon_stream_router_source_1
		# | 
		add_interface avalon_stream_router_source_1 avalon_streaming start
		set_interface_property avalon_stream_router_source_1 associatedClock clk
		set_interface_property avalon_stream_router_source_1 associatedReset reset
		set_interface_property avalon_stream_router_source_1 dataBitsPerSymbol $color_bits
		set_interface_property avalon_stream_router_source_1 errorDescriptor ""
		set_interface_property avalon_stream_router_source_1 maxChannel 0
		set_interface_property avalon_stream_router_source_1 readyLatency 0
		set_interface_property avalon_stream_router_source_1 symbolsPerBeat $color_planes

		add_interface_port avalon_stream_router_source_1 stream_out_ready_1 ready Input 1
		add_interface_port avalon_stream_router_source_1 stream_out_data_1 data Output $dw
		add_interface_port avalon_stream_router_source_1 stream_out_startofpacket_1 startofpacket Output 1
		add_interface_port avalon_stream_router_source_1 stream_out_endofpacket_1 endofpacket Output 1
#		add_interface_port avalon_stream_router_source_1 stream_out_empty_1 empty Output $ew
		add_interface_port avalon_stream_router_source_1 stream_out_valid_1 valid Output 1
		# | 
		# +-----------------------------------
		
		# +-----------------------------------
		# | connection point external_interface
		# | 
		add_interface external_interface conduit end 

		add_interface_port external_interface stream_select export Input 1
		# | 
		# +-----------------------------------
	} else {
		# +-----------------------------------
		# | connection point avalon_stream_router_sink_0
		# | 
		add_interface avalon_stream_router_sink_0 avalon_streaming end 
		set_interface_property avalon_stream_router_sink_0 associatedClock clk
		set_interface_property avalon_stream_router_sink_0 associatedReset reset
		set_interface_property avalon_stream_router_sink_0 dataBitsPerSymbol $color_bits
		set_interface_property avalon_stream_router_sink_0 errorDescriptor ""
		set_interface_property avalon_stream_router_sink_0 maxChannel 0
		set_interface_property avalon_stream_router_sink_0 readyLatency 0
		set_interface_property avalon_stream_router_sink_0 symbolsPerBeat $color_planes

		add_interface_port avalon_stream_router_sink_0 stream_in_data_0 data Input $dw 
		add_interface_port avalon_stream_router_sink_0 stream_in_startofpacket_0 startofpacket Input 1
		add_interface_port avalon_stream_router_sink_0 stream_in_endofpacket_0 endofpacket Input 1
#		add_interface_port avalon_stream_router_sink_0 stream_in_empty_0 empty Input $ew
		add_interface_port avalon_stream_router_sink_0 stream_in_valid_0 valid Input 1
		add_interface_port avalon_stream_router_sink_0 stream_in_ready_0 ready Output 1
		# | 
		# +-----------------------------------

		# +-----------------------------------
		# | connection point avalon_stream_router_sink_1
		# | 
		add_interface avalon_stream_router_sink_1 avalon_streaming end 
		set_interface_property avalon_stream_router_sink_1 associatedClock clk
		set_interface_property avalon_stream_router_sink_1 associatedReset reset
		set_interface_property avalon_stream_router_sink_1 dataBitsPerSymbol $color_bits
		set_interface_property avalon_stream_router_sink_1 errorDescriptor ""
		set_interface_property avalon_stream_router_sink_1 maxChannel 0
		set_interface_property avalon_stream_router_sink_1 readyLatency 0
		set_interface_property avalon_stream_router_sink_1 symbolsPerBeat $color_planes

		add_interface_port avalon_stream_router_sink_1 stream_in_data_1 data Input $dw
		add_interface_port avalon_stream_router_sink_1 stream_in_startofpacket_1 startofpacket Input 1
		add_interface_port avalon_stream_router_sink_1 stream_in_endofpacket_1 endofpacket Input 1
#		add_interface_port avalon_stream_router_sink_1 stream_in_empty_1 empty Input $ew
		add_interface_port avalon_stream_router_sink_1 stream_in_valid_1 valid Input 1
		add_interface_port avalon_stream_router_sink_1 stream_in_ready_1 ready Output 1
		# | 
		# +-----------------------------------

		if { $sync } {
			# +-----------------------------------
			# | connection point avalon_sync_sink 
			# | 
			add_interface avalon_sync_sink avalon_streaming end 
			set_interface_property avalon_sync_sink associatedClock clk
			set_interface_property avalon_sync_sink associatedReset reset
			set_interface_property avalon_sync_sink dataBitsPerSymbol 1
			set_interface_property avalon_sync_sink errorDescriptor ""
			set_interface_property avalon_sync_sink maxChannel 0
			set_interface_property avalon_sync_sink readyLatency 0
			set_interface_property avalon_sync_sink symbolsPerBeat 1

			add_interface_port avalon_sync_sink sync_data data Input 1
			add_interface_port avalon_sync_sink sync_valid valid Input 1
			add_interface_port avalon_sync_sink sync_ready ready Output 1
			# | 
			# +-----------------------------------
		} else {
			# +-----------------------------------
			# | connection point external_interface
			# | 
			add_interface external_interface conduit end 

			add_interface_port external_interface stream_select export Input 1
			# | 
			# +-----------------------------------
		}

		# +-----------------------------------
		# | connection point avalon_stream_router_source
		# | 
		add_interface avalon_stream_router_source avalon_streaming start 
		set_interface_property avalon_stream_router_source associatedClock clk
		set_interface_property avalon_stream_router_source associatedReset reset
		set_interface_property avalon_stream_router_source dataBitsPerSymbol $color_bits
		set_interface_property avalon_stream_router_source errorDescriptor ""
		set_interface_property avalon_stream_router_source maxChannel 0
		set_interface_property avalon_stream_router_source readyLatency 0
		set_interface_property avalon_stream_router_source symbolsPerBeat $color_planes

		add_interface_port avalon_stream_router_source stream_out_ready ready Input 1
		add_interface_port avalon_stream_router_source stream_out_data data Output $dw
		add_interface_port avalon_stream_router_source stream_out_startofpacket startofpacket Output 1
		add_interface_port avalon_stream_router_source stream_out_endofpacket endofpacket Output 1
#		add_interface_port avalon_stream_router_source stream_out_empty empty Output $ew
		add_interface_port avalon_stream_router_source stream_out_valid valid Output 1
		# | 
		# +-----------------------------------
	}
}
# | 
# +-----------------------------------

# +-----------------------------------
# | Generation function
# | 
proc generate {} {
	send_message info "Starting Generation of Video In Stream Router"

	# get parameter values
	set router_type		[ get_parameter_value "router_type" ]
	set sync			[ get_parameter_value "sync" ]
	set color_bits		[ get_parameter_value "color_bits" ]
	set color_planes	[ get_parameter_value "color_planes" ]

	set dw		[ format "DW:%d" [ expr (($color_bits * $color_planes) - 1) ] ]
	if { ($color_planes == 4) || ($color_planes == 3) } {
		set ew	"EW:1"
	} else {
		set ew	"EW:0"
	}

	# set section values
	set use_sync "USE_SYNC:0"
	if { $sync } {
		set use_sync "USE_SYNC:1"
	}
#	if { $router_type == "Split" } {
#		set use_split "USE_SPLIT_MODE:1"
#		set use_merge "USE_MERGE_MODE:0"
#	} else {
#		set use_split "USE_SPLIT_MODE:0"
#		set use_merge "USE_MERGE_MODE:1"
#	}

	# set arguments
	set params "$dw;$ew"
#	set sections "$use_split;$use_merge" 
	set sections "$use_sync" 

	# get generation settings
	set dest_language	[ get_generation_property HDL_LANGUAGE ]
	set dest_dir 		[ get_generation_property OUTPUT_DIRECTORY ]
	set dest_name		[ get_generation_property OUTPUT_NAME ]
	
	set file_ending "v"
	if { $dest_language == "VHDL" || $dest_language == "vhdl" } {
		set file_ending "vhd"
	}

	add_file "$dest_dir$dest_name.$file_ending" {SYNTHESIS SIMULATION}

	# Generate HDL
	source "up_ip_generator.tcl"
	if { $router_type == "Split" } {
		alt_up_generate "$dest_dir$dest_name.$file_ending" "hdl/altera_up_avalon_video_stream_splitter.$file_ending" "altera_up_avalon_video_stream_splitter" $dest_name $params $sections
	} else {
		alt_up_generate "$dest_dir$dest_name.$file_ending" "hdl/altera_up_avalon_video_stream_merger.$file_ending" "altera_up_avalon_video_stream_merger" $dest_name $params $sections
	}
#	alt_up_generate "$dest_dir$dest_name.v" "hdl/altera_up_avalon_video_stream_router.v" $dest_name $params $sections

	# generate top level template
#	#alt_up_create_instantiation_template "$dest_dir$dest_name.inst.v" $dest_name "external_interface"
}
# | 
# +-----------------------------------

