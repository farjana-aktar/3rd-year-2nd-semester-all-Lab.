#include<bits/stdc++.h>
#include<graphics.h>

#define Sin(x) sin(x * acos(-1.0)/180)
#define Cos(x) cos(x * asin(-1.0)/180)

int point, x[10], y[10];
int tx, ty;  // translation factors
int sx, sy;  // scaling factors
int angle;   // anti clockwise rotation angle
int xpivot, ypivot; // pivot point of coordinates

using namespace std;

void drawpoly()
{
    for(int i=0;i<point;i++)
    {
        line(x[i], y[i], x[(i+1)%point], y[(i+1)%point]);
    }
}

void translation()
{
    for(int i=0;i<point;i++)
    {
        x[i] += tx;
        y[i] += ty;
    }
}

void scaling()
{
    for(int i=0;i<point;i++)
    {
        x[i] *= sx;
        y[i] *= sy;
    }
}

void rotation()
{
    for(int i=0;i<point;i++)
    {
        int xshift = x[i] - xpivot;
        int yshift = y[i] - yshift;

        x[i] = xpivot + (xshift * Cos(angle) - yshift * Sin(angle));
        y[i] = ypivot + (xshift * Sin(angle) + yshift * Cos(angle));
    }
}

int main()
{
    int gd=DETECT, gm;
    initgraph(&gd, &gm, "");

    cout << "Enter the number of points : " ;
    cin >> point;

    cout << "Enter the coordinates points : " << endl;
    for(int i=0;i<point;i++)
    {
        cin >> x[i] >> y[i];
    }
    setcolor(RED);
    drawpoly();

    char ch;
    cout << "Which Translation ? Transformation -> T, Scaling -> S, Rotation -> R : ";
    cin >> ch;

    if(ch == 'T')
    {
        cout << "Enter the translation factor : ";
        cin >> tx >> ty;
        translation();
        setcolor(WHITE);
        drawpoly();
    }
    /*..............Input:
3
100 100
100 200
200 100
T
100 100

*/

    else if(ch == 'S')
    {
        cout << "Enter the scaling factor : ";
        cin >> sx >> sy;
        scaling();
        setcolor(WHITE);
        drawpoly();
    }
    /*.........Input:
3
100 100
100 200
200 100
S
2 2

*/
    else
    {
        cout << "Enter the roration angle : ";
        cin >> angle;

        cout << "Enter the pivot points : ";
        cin >> xpivot >> ypivot;

        rotation();
        setcolor(WHITE);
        drawpoly();
    }
    /*        ...............Input:
4
100 100
100 200
200 200
200 100
R
45
200 200
*/
    getch();
    closegraph();
    return 0;
}
