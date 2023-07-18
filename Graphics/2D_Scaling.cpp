#include<graphics.h>
#include<stdio.h>
#include<conio.h>

int numOfVertex;
int x[50],y[50];
int xScale,yScale;
int xFixed,yFixed;

void drawPolygon()
{
    for(int i= 0;i<numOfVertex;i++)
    {
        line(x[i],y[i],x[(i+1)%numOfVertex],y[(i+1)%numOfVertex]);
    }
}
void calculateFixedPoint()
{
    for(int i = 0;i<numOfVertex;i++)
    {
        xFixed += x[i];
        yFixed += y[i];
    }
    xFixed /= numOfVertex;
    yFixed /= numOfVertex;
}
void Scaling()
{
    for(int i = 0;i<numOfVertex;i++)
    {
        x[i] = (x[i]*xScale) + xFixed*(1-xScale);
        y[i] = (y[i]*yScale) + yFixed*(1-yScale);
    }
}

int main()
{
//    cout << "Hello world!" << endl;
    int gd = DETECT;
    int gm;
    initgraph(&gd,&gm,"");

    printf("Enter number of Vertex of your polygon: ");

    scanf("%d",&numOfVertex);

    printf("Enter all vertex in clockwise direction:\n(x,y)\n");

    for(int i =0;i<numOfVertex;i++)
    {
        scanf("%d %d",&x[i],&y[i]);
    }
    printf("Enter Scaling Factor:\n XScale YScale\n");
    scanf("%d %d",&xScale,&yScale);

    drawPolygon();
    calculateFixedPoint();
    Scaling();
    setcolor(YELLOW);
    drawPolygon();

    getchar();
    //delay(500000);
    closegraph();
    return 0;
}
