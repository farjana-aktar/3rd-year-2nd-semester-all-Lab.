#include<bits/stdc++.h>
#include<graphics.h>
#include<conio.h>

using namespace std;

void BresenhamLine(int x1, int y1, int x2, int y2)
{
    int dx = abs(x2-x1);
    int dy = abs(y2-y1);
    int p = 2*dy - dx;

    while(x1<x2 && y1<y2)
    {
        if(p<0)
        {
            x1++;
            p = p + 2*dy;
            putpixel(x1, y2, WHITE);
        }
        else
        {
            x1++;
            y1++;
            p = p + 2*dy - 2*dx;
            putpixel(x1, y1, WHITE);
        }
        delay(1);
    }
}

int main()
{
    int gd = DETECT, gm;
    initgraph(&gd, &gm, "");

    int x1, y1, x2, y2;
    cout << "Enter the two coordinates points : ";
    cin >> x1 >> y1 >> x2 >> y2;

    BresenhamLine(x1, y1, x2, y2);

    getch();
    closegraph();
    return 0;
}
