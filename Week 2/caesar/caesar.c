#include <cs50.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int only_digits(string number);
char rotate(char x, int k);

int main(int argc, string argv[])
{
    if (argc != 2)
    {
        printf("Usage: ./caesar key\n");
        return 1;
    } else if (!(only_digits(argv[1])))
    {
        printf("Usage: ./caesar key\n");
        return 1;
    } else
    {
        int key = atoi(argv[1]);
        // string plain_text = get_string("plaintext:  ");
        printf("%c\n", rotate('A', key));
    }


}

int only_digits(string number)
{
    bool is_only_digits = true;
    int n = strlen(number);


    for (int i = 0; i < n; i++)
    {
        if (!(number[i] >= 48 && number[i] <= 57))
        {
            is_only_digits = false;
        }
    }

    return is_only_digits;
}

char rotate(char x, int k)
{
    string new_x;
    if (x >= 65 && x <= 90)
    {
        x = x + k;

        if (x > 90)
        {
            int overflow_key = x - 90;

            x = 64 + overflow_key;
        }

        return (char) x;
    } else {
        return '!';
    }
}