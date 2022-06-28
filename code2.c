#include <stdio.h>
#include "cube.h"
#include "square.h"

int main()
{
    int edge, choice;
    printf("1 - kwadrat\n2 - szescian\n3 - wyjscie\n");
    printf("Podaj co chcesz policzyc: ");
    scanf("%i", &choice);
    if(choice == 1)
    {
        printf("Podaj krawedz kwadratu: ");
        scanf("%i", &edge);
        square_area(edge);
    }
    else if(choice == 2)
    {
        printf("Podaj krawedz szescianu: ");
        scanf("%i", &edge);
        cube_volume(edge);
    }
    else
    {
        printf("Do widzenia\n");
    }
    return 0
