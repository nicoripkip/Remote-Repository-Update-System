#include <stdio.h>
#include <string.h>


void boot_screen();
void check_arguments(char *);


int main(int argc, char *argv[])
{
    int i;

    boot_screen();

    if (argc < 2)
    {
        printf("Too few arguments given.....\n");
    } 
    else
    {
        for (i = 1; i < argc; i++)
        {
            // check_arguments(argv[i]);
        }
    }

    return 0;
}


/**
 * @brief Functie voor het opzetten van het opstartscherm van het programma
 * 
 */
void boot_screen()
{
    printf("Loading.....\n\n\n");

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
void check_arguments(char *argument)
{
    if (strchr(argument, '=') != NULL)
    {
        char *result = strtok(argument, "=");

        while (result != NULL)
        {
            printf("i: %s\n", result);
        }

        printf("Argument: %s has an parameter!\n", argument);
    }
    else
    {
        printf("Argument: %s has no parameter!\n", argument);
    }
}