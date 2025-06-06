set(BUILD_DOC ${DOC_OPTION_NAME}_BUILD_DOC)
option(${BUILD_DOC} "Build documentation (${DOC_OPTION_NAME})" OFF)

if (${BUILD_DOC})
	find_package(Doxygen)

	if (DOXYGEN_FOUND)
		# set input and output files
		set(DOXYGEN_IN ${CMAKE_SOURCE_DIR}/Configs/Doxyfile.in)
		set(DOXYGEN_OUT ${CMAKE_BINARY_DIR}/Docs/${DOC_OPTION_NAME}/Doxyfile)

		# request to configure the file
		configure_file(${DOXYGEN_IN} ${DOXYGEN_OUT} @ONLY)
		message("Doxygen build started for ${DOC_TARGET_NAME}")

		# note the option ALL which allows to build the docs together with the application
		add_custom_target(_run_doxygen_${DOC_TARGET_NAME} ALL
			COMMAND ${DOXYGEN_EXECUTABLE} ${DOXYGEN_OUT}
			WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
			COMMENT "Generating API documentation with Doxygen"
			VERBATIM)
	else(DOXYGEN_FOUND)
	  message("Doxygen need to be installed to generate the doxygen documentation")
	endif(DOXYGEN_FOUND)
	
endif(${BUILD_DOC})