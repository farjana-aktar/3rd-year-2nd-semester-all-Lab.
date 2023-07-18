#include <bits/stdc++.h>
using namespace std;

int pagefault(int pages[], int n, int capacity)
{
    set<int> s;
    map<int, int> indexes;

    int page_fault = 0;

    for (int i = 0; i < n; i++)
    {
        if (s.size() < capacity)
        {
            if (s.find(pages[i]) == s.end())
            {
                s.insert(pages[i]);
                page_fault++;
            }
            indexes[pages[i]] = i;
        }
        else
        {
            if (s.find(pages[i]) == s.end())
            {
                int lru = INT_MAX, val;
                for (auto it : s)
                {
                    if (indexes[it] < lru)
                    {
                        lru = indexes[it];
                        val = it;
                    }
                }
                s.erase(val);
                s.insert(pages[i]);

                page_fault++;
            }
            indexes[pages[i]] = i;
        }
    }
    return page_fault;
}

int main()
{
    int capacity;
    cout << "Enter the page capacity : ";
    cin >> capacity; // 4

    int n;
    cout << "Enter the number of refrence pages : ";
    cin >> n; // 13

    int pages[n];
    cout << "Enter the refrence string : " << endl;
    for (int i = 0; i < n; i++)
    {
        cin >> pages[i]; // 7 0 1 2 0 3 0 4 2 3 0 3 2
    }

    cout << "Page Faults : " << pagefault(pages, n, capacity) << endl;
}