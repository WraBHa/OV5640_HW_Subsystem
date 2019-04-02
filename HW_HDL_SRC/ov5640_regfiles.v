`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/15/2019 06:56:01 PM
// Design Name: 
// Module Name: ov5640_regfiles
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ov5640_regfiles(
input       [8:0]   cfg_addr,
output reg [23:0]   cfg_data
     );

always @ (*) begin
	case (cfg_addr)	
		'd000:  cfg_data  =   {16'h3023, 8'h01};  // continue auto focus
		'd001:  cfg_data  =   {16'h3022, 8'h04};

		'd003:  cfg_data  =   {16'h3103, 8'h03};
		'd004:  cfg_data  =   {16'h3017, 8'hff};
		'd005:  cfg_data  =   {16'h3018, 8'hff};
		'd006:  cfg_data  =   {16'h3034, 8'h1A};
		'd007:  cfg_data  =   {16'h3037, 8'h13};
		'd008:  cfg_data  =   {16'h3108, 8'h01};       
		'd009:  cfg_data  =   {16'h3630, 8'h36};
                                             
		'd010:  cfg_data  =   {16'h3631, 8'h0e};
		'd011:  cfg_data  =   {16'h3632, 8'he2};
		'd012:  cfg_data  =   {16'h3633, 8'h12};
		'd013:  cfg_data  =   {16'h3621, 8'he0};
		'd014:  cfg_data  =   {16'h3704, 8'ha0};
		'd015:  cfg_data  =   {16'h3703, 8'h5a};
		'd016:  cfg_data  =   {16'h3715, 8'h78};
		'd017:  cfg_data  =   {16'h3717, 8'h01};
		'd018:  cfg_data  =   {16'h370b, 8'h60};
		'd019:  cfg_data  =   {16'h3705, 8'h1a};
                                           
		'd020:  cfg_data  =   {16'h3905, 8'h02};
		'd021:  cfg_data  =   {16'h3906, 8'h10};
		'd022:  cfg_data  =   {16'h3901, 8'h0a};
		'd023:  cfg_data  =   {16'h3731, 8'h12};
		'd024:  cfg_data  =   {16'h3600, 8'h08};
		'd025:  cfg_data  =   {16'h3601, 8'h33};
		'd026:  cfg_data  =   {16'h302d, 8'h60};
		'd027:  cfg_data  =   {16'h3620, 8'h52};
		'd028:  cfg_data  =   {16'h371b, 8'h20};
		'd029:  cfg_data  =   {16'h471c, 8'h50};
                                            
		'd030:  cfg_data  =   {16'h3a13, 8'h43};
		'd031:  cfg_data  =   {16'h3a18, 8'h00};
		'd032:  cfg_data  =   {16'h3a19, 8'hf8};
		'd033:  cfg_data  =   {16'h3635, 8'h13};
		'd034:  cfg_data  =   {16'h3636, 8'h03};
		'd035:  cfg_data  =   {16'h3634, 8'h40};
		'd036:  cfg_data  =   {16'h3622, 8'h01};
		'd037:  cfg_data  =   {16'h3c01, 8'h34};
		'd038:  cfg_data  =   {16'h3c04, 8'h28};
		'd039:  cfg_data  =   {16'h3c05, 8'h98};     
                                            
		'd040:  cfg_data  =   {16'h3c06, 8'h00};
		'd041:  cfg_data  =   {16'h3c07, 8'h08};
		'd042:  cfg_data  =   {16'h3c08, 8'h00};
		'd043:  cfg_data  =   {16'h3c09, 8'h1c};
		'd044:  cfg_data  =   {16'h3c0a, 8'h9c};
		'd045:  cfg_data  =   {16'h3c0b, 8'h40};
		'd046:  cfg_data  =   {16'h3810, 8'h00};
		'd047:  cfg_data  =   {16'h3811, 8'h10};
		'd048:  cfg_data  =   {16'h3812, 8'h00};
		'd049:  cfg_data  =   {16'h3708, 8'h64};
                                            
		'd050:  cfg_data  =   {16'h4001, 8'h02};
		'd051:  cfg_data  =   {16'h4005, 8'h1a};
		'd052:  cfg_data  =   {16'h3000, 8'h00};
		'd053:  cfg_data  =   {16'h3004, 8'hff};
		'd054:  cfg_data  =   {16'h300e, 8'h58};
		'd055:  cfg_data  =   {16'h302e, 8'h00};
		'd056:  cfg_data  =   {16'h4300, 8'h61};    // format RGB565
		'd057:  cfg_data  =   {16'h501f, 8'h01};    // format RGB
		'd058:  cfg_data  =   {16'h440e, 8'h00};
		'd059:  cfg_data  =   {16'h5000, 8'ha7};    
                                             
		'd060:  cfg_data  =   {16'h3a0f, 8'h30};
		'd061:  cfg_data  =   {16'h3a10, 8'h28};
		'd062:  cfg_data  =   {16'h3a1b, 8'h30};
		'd063:  cfg_data  =   {16'h3a1e, 8'h26};
		'd064:  cfg_data  =   {16'h3a11, 8'h60};
		'd065:  cfg_data  =   {16'h3a1f, 8'h14};
		'd066:  cfg_data  =   {16'h5800, 8'h23};
		'd067:  cfg_data  =   {16'h5801, 8'h14};
		'd068:  cfg_data  =   {16'h5802, 8'h0f};
		'd069:  cfg_data  =   {16'h5803, 8'h0f};  
                                            
		'd070:  cfg_data  =   {16'h5804, 8'h12};
		'd071:  cfg_data  =   {16'h5805, 8'h26};
		'd072:  cfg_data  =   {16'h5806, 8'h0c};
		'd073:  cfg_data  =   {16'h5807, 8'h08};
		'd074:  cfg_data  =   {16'h5808, 8'h05};
		'd075:  cfg_data  =   {16'h5809, 8'h05};
		'd076:  cfg_data  =   {16'h580a, 8'h08};
		'd077:  cfg_data  =   {16'h580b, 8'h0d};
		'd078:  cfg_data  =   {16'h580c, 8'h08};
		'd079:  cfg_data  =   {16'h580d, 8'h03};    
                                          
		'd080:  cfg_data  =   {16'h580e, 8'h00};
		'd081:  cfg_data  =   {16'h580f, 8'h00};
		'd082:  cfg_data  =   {16'h5810, 8'h03};
		'd083:  cfg_data  =   {16'h5811, 8'h09};
		'd084:  cfg_data  =   {16'h5812, 8'h07};
		'd085:  cfg_data  =   {16'h5813, 8'h03};
		'd086:  cfg_data  =   {16'h5814, 8'h00};
		'd087:  cfg_data  =   {16'h5815, 8'h01};
		'd088:  cfg_data  =   {16'h5816, 8'h03};
		'd089:  cfg_data  =   {16'h5817, 8'h08};  
                                           
		'd090:  cfg_data  =   {16'h5818, 8'h0d};
		'd091:  cfg_data  =   {16'h5819, 8'h08};
		'd092:  cfg_data  =   {16'h581a, 8'h05};
		'd093:  cfg_data  =   {16'h581b, 8'h06};
		'd094:  cfg_data  =   {16'h581c, 8'h08};
		'd095:  cfg_data  =   {16'h581d, 8'h0e};
		'd096:  cfg_data  =   {16'h581e, 8'h29};
		'd097:  cfg_data  =   {16'h581f, 8'h17};
		'd098:  cfg_data  =   {16'h5820, 8'h11};
		'd099:  cfg_data  =   {16'h5821, 8'h11};     
                                              
		'd100:  cfg_data  =   {16'h5822, 8'h15};
		'd101:  cfg_data  =   {16'h5823, 8'h28};
		'd102:  cfg_data  =   {16'h5824, 8'h46};
		'd103:  cfg_data  =   {16'h5825, 8'h26};
		'd104:  cfg_data  =   {16'h5826, 8'h08};
		'd105:  cfg_data  =   {16'h5827, 8'h26};
		'd106:  cfg_data  =   {16'h5828, 8'h64};
		'd107:  cfg_data  =   {16'h5829, 8'h26};
		'd108:  cfg_data  =   {16'h582a, 8'h24};
		'd109:  cfg_data  =   {16'h582b, 8'h22};       
                                            
		'd110:  cfg_data  =   {16'h582c, 8'h24};
		'd111:  cfg_data  =   {16'h582d, 8'h24};
		'd112:  cfg_data  =   {16'h582e, 8'h06};
		'd113:  cfg_data  =   {16'h582f, 8'h22};
		'd114:  cfg_data  =   {16'h5830, 8'h40};
		'd115:  cfg_data  =   {16'h5831, 8'h42};
		'd116:  cfg_data  =   {16'h5832, 8'h24};
		'd117:  cfg_data  =   {16'h5833, 8'h26};
		'd118:  cfg_data  =   {16'h5834, 8'h24};
		'd119:  cfg_data  =   {16'h5835, 8'h22};        
                                            
		'd120:  cfg_data  =   {16'h5836, 8'h22};
		'd121:  cfg_data  =   {16'h5837, 8'h26};
		'd122:  cfg_data  =   {16'h5838, 8'h44};
		'd123:  cfg_data  =   {16'h5839, 8'h24};
		'd124:  cfg_data  =   {16'h583a, 8'h26};
		'd125:  cfg_data  =   {16'h583b, 8'h28};
		'd126:  cfg_data  =   {16'h583c, 8'h42};
		'd127:  cfg_data  =   {16'h583d, 8'hce};
		'd128:  cfg_data  =   {16'h5180, 8'hff};
		'd129:  cfg_data  =   {16'h5181, 8'hf2};   
                                            
		'd130:  cfg_data  =   {16'h5182, 8'h00};
		'd131:  cfg_data  =   {16'h5183, 8'h14};
		'd132:  cfg_data  =   {16'h5184, 8'h25};
		'd133:  cfg_data  =   {16'h5185, 8'h24};
		'd134:  cfg_data  =   {16'h5186, 8'h09};
		'd135:  cfg_data  =   {16'h5187, 8'h09};
		'd136:  cfg_data  =   {16'h5188, 8'h09};
		'd137:  cfg_data  =   {16'h5189, 8'h75};
		'd138:  cfg_data  =   {16'h518a, 8'h54};
		'd139:  cfg_data  =   {16'h518b, 8'he0};   
                                            
		'd140:  cfg_data  =   {16'h518c, 8'hb2};
		'd141:  cfg_data  =   {16'h518d, 8'h42};
		'd142:  cfg_data  =   {16'h518e, 8'h3d};
		'd143:  cfg_data  =   {16'h518f, 8'h56};
		'd144:  cfg_data  =   {16'h5190, 8'h46};
		'd145:  cfg_data  =   {16'h5191, 8'hf8};
		'd146:  cfg_data  =   {16'h5192, 8'h04};
		'd147:  cfg_data  =   {16'h5193, 8'h70};
		'd148:  cfg_data  =   {16'h5194, 8'hf0};
		'd149:  cfg_data  =   {16'h5195, 8'hf0};   
                                             
		'd150:  cfg_data  =   {16'h5196, 8'h03};
		'd151:  cfg_data  =   {16'h5197, 8'h01};
		'd152:  cfg_data  =   {16'h5198, 8'h04};
		'd153:  cfg_data  =   {16'h5199, 8'h12};
		'd154:  cfg_data  =   {16'h519a, 8'h04};
		'd155:  cfg_data  =   {16'h519b, 8'h00};
		'd156:  cfg_data  =   {16'h519c, 8'h06};
		'd157:  cfg_data  =   {16'h519d, 8'h82};
		'd158:  cfg_data  =   {16'h519e, 8'h38};
		'd159:  cfg_data  =   {16'h5480, 8'h01};   
                                             
		'd160:  cfg_data  =   {16'h5481, 8'h08};
		'd161:  cfg_data  =   {16'h5482, 8'h14};
		'd162:  cfg_data  =   {16'h5483, 8'h28};
		'd163:  cfg_data  =   {16'h5484, 8'h51};
		'd164:  cfg_data  =   {16'h5485, 8'h65};
		'd165:  cfg_data  =   {16'h5486, 8'h71};
		'd166:  cfg_data  =   {16'h5487, 8'h7d};
		'd167:  cfg_data  =   {16'h5488, 8'h87};
		'd168:  cfg_data  =   {16'h5489, 8'h91};
		'd169:  cfg_data  =   {16'h548a, 8'h9a};   
                                            
		'd170:  cfg_data  =   {16'h548b, 8'haa};
		'd171:  cfg_data  =   {16'h548c, 8'hb8};
		'd172:  cfg_data  =   {16'h548d, 8'hcd};
		'd173:  cfg_data  =   {16'h548e, 8'hdd};
		'd174:  cfg_data  =   {16'h548f, 8'hea};
		'd175:  cfg_data  =   {16'h5490, 8'h1d};
		'd176:  cfg_data  =   {16'h5381, 8'h1e};
		'd177:  cfg_data  =   {16'h5382, 8'h5b};
		'd178:  cfg_data  =   {16'h5383, 8'h08};
		'd179:  cfg_data  =   {16'h5384, 8'h0a};  
                                              
		'd180:  cfg_data  =   {16'h5385, 8'h7e};
		'd181:  cfg_data  =   {16'h5386, 8'h88};
		'd182:  cfg_data  =   {16'h5387, 8'h7c};
		'd183:  cfg_data  =   {16'h5388, 8'h6c};
		'd184:  cfg_data  =   {16'h5389, 8'h10};
		'd185:  cfg_data  =   {16'h538a, 8'h01};
		'd186:  cfg_data  =   {16'h538b, 8'h98};
		'd187:  cfg_data  =   {16'h5580, 8'h06};
		'd188:  cfg_data  =   {16'h5583, 8'h40};
		'd189:  cfg_data  =   {16'h5584, 8'h10};  
                                             
		'd190:  cfg_data  =   {16'h5589, 8'h10};
		'd191:  cfg_data  =   {16'h558a, 8'h00};
		'd192:  cfg_data  =   {16'h558b, 8'hf8};
		'd193:  cfg_data  =   {16'h501d, 8'h40};
		'd194:  cfg_data  =   {16'h5300, 8'h08};
		'd195:  cfg_data  =   {16'h5301, 8'h30};
		'd196:  cfg_data  =   {16'h5302, 8'h10};
		'd197:  cfg_data  =   {16'h5303, 8'h00};
		'd198:  cfg_data  =   {16'h5304, 8'h08};
		'd199:  cfg_data  =   {16'h5305, 8'h30};  
                                             
		'd200:  cfg_data  =   {16'h5306, 8'h08};
		'd201:  cfg_data  =   {16'h5307, 8'h16};
		'd202:  cfg_data  =   {16'h5309, 8'h08};
		'd203:  cfg_data  =   {16'h530a, 8'h30};
		'd204:  cfg_data  =   {16'h530b, 8'h04};
		'd205:  cfg_data  =   {16'h530c, 8'h06};
		'd206:  cfg_data  =   {16'h5025, 8'h00};
		'd207:  cfg_data  =   {16'h3008, 8'h02};
		'd208:  cfg_data  =   {16'h3035, 8'h11};
		'd209:  cfg_data  =   {16'h3036, 8'h46}; 
                                            
		'd210:  cfg_data  =   {16'h3c07, 8'h08};
		'd211:  cfg_data  =   {16'h3820, 8'h41};
		'd212:  cfg_data  =   {16'h3821, 8'h07};
		'd213:  cfg_data  =   {16'h3814, 8'h31};
		'd214:  cfg_data  =   {16'h3815, 8'h31};
		'd215:  cfg_data  =   {16'h3800, 8'h00};
		'd216:  cfg_data  =   {16'h3801, 8'h00};
		'd217:  cfg_data  =   {16'h3802, 8'h00};
		'd218:  cfg_data  =   {16'h3803, 8'h04};
		'd219:  cfg_data  =   {16'h3804, 8'h0a};  
                                           
		'd220:  cfg_data  =   {16'h3805, 8'h3f};
		'd221:  cfg_data  =   {16'h3806, 8'h07};
		'd222:  cfg_data  =   {16'h3807, 8'h9b};
		'd223:  cfg_data  =   {16'h3808, 8'h03};
		'd224:  cfg_data  =   {16'h3809, 8'h20};
		'd225:  cfg_data  =   {16'h380a, 8'h02};
		'd226:  cfg_data  =   {16'h380b, 8'h58};
		'd227:  cfg_data  =   {16'h380c, 8'h07};
		'd228:  cfg_data  =   {16'h380d, 8'h68};
		'd229:  cfg_data  =   {16'h380e, 8'h03}; 
                                            
		'd230:  cfg_data  =   {16'h380f, 8'hd8};
		'd231:  cfg_data  =   {16'h3813, 8'h06};
		'd232:  cfg_data  =   {16'h3618, 8'h00};
		'd233:  cfg_data  =   {16'h3612, 8'h29};
		'd234:  cfg_data  =   {16'h3709, 8'h52};
		'd235:  cfg_data  =   {16'h370c, 8'h03};
		'd236:  cfg_data  =   {16'h3a02, 8'h17};
		'd237:  cfg_data  =   {16'h3a03, 8'h10};
		'd238:  cfg_data  =   {16'h3a14, 8'h17};
		'd239:  cfg_data  =   {16'h3a15, 8'h10}; 
                                           
		'd240:  cfg_data  =   {16'h4004, 8'h02};
		'd241:  cfg_data  =   {16'h3002, 8'h1c};
		'd242:  cfg_data  =   {16'h3006, 8'hc3};
		'd243:  cfg_data  =   {16'h4713, 8'h03};
		'd244:  cfg_data  =   {16'h4407, 8'h04};
		'd245:  cfg_data  =   {16'h460b, 8'h35};
		'd246:  cfg_data  =   {16'h460c, 8'h22};
		'd247:  cfg_data  =   {16'h4837, 8'h22};
		'd248:  cfg_data  =   {16'h3824, 8'h02};
		'd249:  cfg_data  =   {16'h5001, 8'ha3}; 
                                            
		'd250:  cfg_data  =   {16'h3503, 8'h00};
		'd251:  cfg_data  =   {16'h3035, 8'h21};       // PLL     input clock =24Mhz, PCLK =84Mhz
		'd252:  cfg_data  =   {16'h3036, 8'h46};
		'd253:  cfg_data  =   {16'h3c07, 8'h07};
		'd254:  cfg_data  =   {16'h3820, 8'h47};
		'd255:  cfg_data  =   {16'h3821, 8'h07};
		'd256:  cfg_data  =   {16'h3814, 8'h31};
		'd257:  cfg_data  =   {16'h3815, 8'h31};
		'd258:  cfg_data  =   {16'h3800, 8'h01};       // HS
		'd259:  cfg_data  =   {16'h3801, 8'h00};       // HS
                                             
		'd260:  cfg_data  =   {16'h3802, 8'h00};       // VS
		'd261:  cfg_data  =   {16'h3803, 8'h04};       // VS
		'd262:  cfg_data  =   {16'h3804, 8'h0a};       // HW (HE)
		'd263:  cfg_data  =   {16'h3805, 8'h2f};       // HW (HE)
		'd264:  cfg_data  =   {16'h3806, 8'h07};       // VH (VE)
		'd265:  cfg_data  =   {16'h3807, 8'h9b};       // VH (VE)
		'd266:  cfg_data  =   {16'h3808, 8'h02};       // DVPHO     (640)
		'd267:  cfg_data  =   {16'h3809, 8'h80};       // DVPHO     (640)
		'd268:  cfg_data  =   {16'h380a, 8'h01};       // DVPVO     (480)
		'd269:  cfg_data  =   {16'h380b, 8'he0};       // DVPVO     (480)
                                            
		'd270:  cfg_data  =   {16'h380c, 8'h08};       // HTS       (2200) 
		'd271:  cfg_data  =   {16'h380d, 8'h9b};       // HTS
		'd272:  cfg_data  =   {16'h380e, 8'h05};       // VTS       (1280)
		'd273:  cfg_data  =   {16'h380f, 8'h00};       // VTS
		'd274:  cfg_data  =   {16'h3810, 8'h00};
		'd275:  cfg_data  =   {16'h3811, 8'h08};
		'd276:  cfg_data  =   {16'h3812, 8'h00};
		'd278:  cfg_data  =   {16'h3813, 8'h06};       // timing V offset

		'd279:  cfg_data  =   {16'h3618, 8'h00};
		'd280:  cfg_data  =   {16'h3612, 8'h29};
		'd281:  cfg_data  =   {16'h3709, 8'h52};
		'd282:  cfg_data  =   {16'h370c, 8'h03};
		'd283:  cfg_data  =   {16'h3a02, 8'h02}; 
                                              
		'd284:  cfg_data  =   {16'h3a03, 8'he0};
		'd285:  cfg_data  =   {16'h3a14, 8'h02};
		'd286:  cfg_data  =   {16'h3a15, 8'he0};
		'd287:  cfg_data  =   {16'h4004, 8'h02}; 
                                            
		'd288:  cfg_data  =   {16'h3002, 8'h1c};
		'd289:  cfg_data  =   {16'h3006, 8'hc3};
		'd290:  cfg_data  =   {16'h4713, 8'h03};
		'd291:  cfg_data  =   {16'h4407, 8'h04};
		'd292:  cfg_data  =   {16'h460b, 8'h37};
		'd293:  cfg_data  =   {16'h460c, 8'h20};
		'd294:  cfg_data  =   {16'h4837, 8'h16};
		'd295:  cfg_data  =   {16'h3824, 8'h04};       // PCLK manual divider
		'd296:  cfg_data  =   {16'h5001, 8'h83};
		'd297:  cfg_data  =   {16'h3503, 8'h00}; 
                                           
		'd298:  cfg_data  =   {16'h3016, 8'h02};
		'd299:  cfg_data  =   {16'h3b07, 8'h0a};
		'd300:  cfg_data  =   {16'h3b00, 8'h83};
		'd301:  cfg_data  =   {16'h3b00, 8'h00};
		default:
			cfg_data = 24'd0;
	endcase 
end 

endmodule
