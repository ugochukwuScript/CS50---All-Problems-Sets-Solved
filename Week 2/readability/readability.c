#include <cs50.h>
#include <stdio.h>
#include <string.h>

int count_letters(string text);

int main(void)
{
    string text = get_string("Text: ");
    int n = count_letters(text);
    printf("%i", n);
}

int count_letters(string text)
{
    int letters = 0;
    for (int i = 0, n = strlen(text); i < n; i++)
    {
        if (text[i] != 32)
        {
            letters ++;
        }
    }

    return letters;
}