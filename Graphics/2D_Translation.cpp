#include<graphics.h>
#include<stdio.h>
#include<conio.h>

int numOfVertex;
int x[50],y[50];
int xShift,yShift;

void drawPolygon()
{
    for(int i= 0;i<numOfVertex;i++)
    {
        line(x[i],y[i],x[(i+1)%numOfVertex],y[(i+1)%numOfVertex]);
    }
}
void translation()
{
    for(int i = 0;i<numOfVertex;i++)
    {
        x[i]+=xShift;
        y[i]+=yShift;
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
    printf("Enter Translation Factor:\n XShift YShift\n");
    scanf("%d %d",&xShift,&yShift);
    cleardevice();
    drawPolygon();
    translation();
    setcolor(YELLOW);
    drawPolygon();

    getch();
    return 0;
}
/*
Input: numOfVertex 4
    50 50
    100 50
    100 100
    50 100
    xShift yShift
    25 25
*/
