#include<bits/stdc++.h>
#include<graphics.h>

using namespace std;

int fact(int n)
{
    if(n <= 1)
        return 1;
    return n * fact(n-1);
}

void Bezier(int x[], int y[], int n)
{
    double xt, yt, u, b;
    int nfact = fact(n-1);

    for(u=0.0;u<1.0;u+=0.001)
    {
        xt=0;
        yt=0;

        putpixel(x[0], y[0], WHITE);
        for(int i=0;i<n;i++)
        {
            b = (nfact * pow(1-u, n-i-1) * pow(u,i))/(fact(n-i-1) * fact(i));

            xt += b*x[i];
            yt += b*y[i];
        }
        putpixel(xt, yt, YELLOW);
    }
    putpixel(x[n-1], y[n-1], WHITE);

    for(int i=0;i<n;i++)
    {
        circle(x[i], y[i], n);
    }
}

int main()
{
    int gd = DETECT, gm;
    initgraph(&gd, &gm, "");

    int n;
    cout << "Enter the number of control points : ";
    cin >> n;

    int x[n], y[n];
    cout << "Enter the control points : ";
    for(int i=0;i<n;i++)
    {
        cin >> x[i] >> y[i];
    }

    Bezier(x, y, n);

    getch();
    closegraph();
    return 0;
}
