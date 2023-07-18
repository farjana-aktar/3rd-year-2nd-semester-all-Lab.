#include<bits/stdc++.h>
using namespace std;

int pagefaults(int pages[], int n, int capacity)
{
    vector<int>v;
    map<int, int>mp;

    int page_faults = 0;

    for(int i=0;i<n;i++)
    {
        auto it = find(v.begin(), v.end(), pages[i]);
        if(it == v.end())
        {
            if(v.size()== capacity)
            {
                v.erase(v.begin());
                mp[v[0]]--;
            }
            v.push_back(pages[i]);
            mp[pages[i]]++;
            page_faults++;
        }

        else
        {
            mp[pages[i]++];
            v.erase(it);
            v.push_back(pages[i]);
        }

        int k = v.size()-2;

        while(mp[v[k]] > mp[v[k+1]] && k > -1)
        {
            swap(v[k+1], v[k]);
            k--;
        }
    }
    return page_faults;
}

int main()
{
    int pages[] = { 1, 2, 3, 4, 2, 1, 5 };
    int n = 7, capacity = 3;
 
    cout << "Page Faults = " << pagefaults(pages, capacity, n)
         << endl;
    cout << "Page Hits = " << n - pagefaults(pages, capacity, n);
    return 0;
}