#include<bits/stdc++.h>
#include<graphics.h>
#include<conio.h>

using namespace std;

void MidPointCircle(int x1, int y1, int r)
{
    int x = 0;
    int y = r;
    int p = 1-r;

    while(x<y)
    {
        putpixel(x1+x, y1+y, 7);
        putpixel(x1+x, y1-y, 7);
        putpixel(x1-x, y1+y, 7);
        putpixel(x1-x, y1-y, 7);

        putpixel(x1+y, y1+x, 7);
        putpixel(x1+y, y1-x, 7);
        putpixel(x1-y, y1+x, 7);
        putpixel(x1-y, y1-x, 7);

        x++;

        if(p<0)
        {
            p = p+2*x+1;
        }
        else
        {
            y--;
            p = p+2*x+1-2*y;
        }
        delay(1);
    }
}

int main()
{
    int gd = DETECT, gm;
    initgraph(&gd, &gm, "");

    int x, y, r;
    cout << "Enter the radius of the circle : ";
    cin >> r;    // radius = 200

    cout << "Enter the coordinate of the center(x and y) : ";
    cin >> x >> y;  // x = 250 y = 250

    MidPointCircle(x, y, r);
    getch();
    closegraph();
    return 0;
}
