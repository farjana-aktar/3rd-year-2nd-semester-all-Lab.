#include <graphics.h>

const int LEFT = 1, RIGHT = 2, BOTTOM = 4, TOP = 8;
double xmin, ymin, xmax, ymax;

int ComputCode(double x, double y)
{
    int code = 0;
    if(x < xmin)
        code |= LEFT;
    else if(x > xmax)
        code |= RIGHT;
    else if(y < ymin)
        code |= BOTTOM;
    else if(y > ymax)
        code |= TOP;
    return code;
}


void Cohen(double x0, double y0, double x1, double y1)
{
    int outcode0 = ComputCode(x0, y0);
    int outcode1 = ComputCode(x1, y1);
    int accept = 0;

    while(1)
    {
        if(!(outcode0 | outcode1))
        {
            accept = 1;
            break;
        }
        else if(outcode0 & outcode1)
        {
            break;
        }
        else
        {
            int outcodeout = outcode0 ? outcode0 : outcode1;
            double x, y;

            if(outcodeout & TOP)
            {
                x = x0 + (x1-x0)*(ymax-y0)/(y1-y0);
                y = ymax;
            }
            else if(outcodeout & BOTTOM)
            {
                x = x0 + (x1-x0)*(ymin-y0)/(y1-y0);
                y = ymin;
            }
            else if(outcodeout & RIGHT)
            {
                y = y0 + (y1-y0)*(xmax-x0)/(x1-x0);
                x = xmax;
            }
            else if(outcodeout & LEFT)
            {
                y = y0 + (y1-y0)*(xmin-x0)/(x1-x0);
                x = xmin;
            }

            if(outcodeout == outcode0)
            {
                x0 = x;
                y0 = y;
                outcode0 = ComputCode(x0,y0);
            }
            else
            {
                x1 = x;
                y1 = y;
                outcode1 = ComputCode(x1, y1);
            }
        }
    }
    if(accept)
    {
        setcolor(WHITE);
        rectangle(xmin, ymin, xmax, ymax);
        setcolor(YELLOW);
        line(x0, y0, x1, y1);
    }
}

int main()
{
    int gd = DETECT, gm = DETECT;
    initgraph(&gd, &gm, "");

    xmin = 100;
    xmax = 500;
    ymin = 10;
    ymax = 300;

    double x0, y0, x1, y1;
    x0 = 50, y0 = 50, x1 = 600, y1 = 90;

    Cohen(x0, y0, x1, y1);
    getch();
    return 0;

}

