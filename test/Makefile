YOUR_FIRST_CMD=true        #Let's say that this is a command exited with error code
YOUR_SECOND_CMD=echo "both commands executed successfuly"

# Let's assume 42 is error code
# and assume 1337 is the success code

up:
	@echo "ExitCode=1337" > .env.mk
	@make build
	@ExitCode=`cat .env.mk | grep ExitCode | cut -d "=" -f2-`;\
        if [[ $$ExitCode -eq 1337 ]];\
        then\
            make create;\
        fi;
	@rm .env.mk


build:
	@(${YOUR_FIRST_CMD}) || echo "ExitCode=42" > .env.mk
#the following line just for debug
	@echo first command executed, ExitCode from .env.mk is `cat .env.mk | grep ExitCode | cut -d "=" -f2-`;



create:
	@$(YOUR_SECOND_CMD)
