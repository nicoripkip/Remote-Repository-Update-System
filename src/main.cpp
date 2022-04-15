#include <iostream>
#include <stdio.h>
#include <string>
#include <vector>


void boot_screen();
void check_arguments(std::string*);


/**
 * @brief Functie voor het starten van het programma
 * 
 * @param argc 
 * @param argv 
 * @return int 
 */
int main(int argc, char *argv[])
{
    printf("test");

    return 0;
}


/**
 * @brief Functie voor het opzetten van het opstartscherm van het programma
 * 
 */
void boot_screen()
{
    std::cout << "Loading....." << std::endl;

    printf("\t      *******   **     **  ********  ********\n \
            /**////** /**    /** **//////  **////// \n \
            /**   /** /**    /**/**       /**       \n \
            /*******  /**    /**/*********/*********\n \
            /**///**  /**    /**////////**////////**\n \
            /**  //** /**    /**       /**       /**\n \
            /**   //**//*******  ********  ******** \n \
            //     //  ///////  ////////  //////// \n\n");

    printf("Remote Repository Update System\n\n");
    printf("Copyright: Nico van Ommen\n");
}


/**
 * @brief Functie voor het controleren van het argument
 * 
 * @param argument 
 */
void check_arguments(std::string *argument)
{
    if (argument->find("=") != std::string::npos)
    {

        std::cout << "[info]\t\tArgument: " << argument << " has a parameter!" << std::endl;
    }
    else
    {
        printf("Argument: %s has no parameter!\n", argument);
    }
}
