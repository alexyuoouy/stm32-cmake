# name of targets
set(BIN_TARGET ${PROJECT_NAME}.bin)
set(HEX_TARGET ${PROJECT_NAME}.hex)

# create binary & hex files and show size of resulting firmware image
add_custom_command(TARGET ${PROJECT_NAME}.elf POST_BUILD
        COMMAND ${CMAKE_OBJCOPY} -Oihex $<TARGET_FILE:${PROJECT_NAME}.elf> ${HEX_TARGET}
        COMMAND ${CMAKE_OBJCOPY} -Obinary $<TARGET_FILE:${PROJECT_NAME}.elf> ${BIN_TARGET}
	COMMAND ${CMAKE_SIZE} $<TARGET_FILE:${PROJECT_NAME}.elf> 
        COMMENT "Generating ${HEX_TARGET}, ${BIN_TARGET}")
