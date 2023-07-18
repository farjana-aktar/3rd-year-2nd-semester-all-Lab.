#include<bits/stdc++.h>
using namespace std;

int pageFaults(int pages[], int n, int frame)
{
	unordered_set<int> set;
	unordered_map<int, int> indexes;

	int page_faults = 0;

	for (int i=0; i<n; i++)
	{
		if (set.size() < frame)
		{
			if (set.find(pages[i])==set.end())
			{
				set.insert(pages[i]);
				page_faults++;
			}
			indexes[pages[i]] = i;
		}

		else
		{
			if (set.find(pages[i]) == set.end())
			{
				int lru = INT_MAX, val;
				for (auto it:set)
				{
					if (indexes[it] < lru)
					{
						lru = indexes[it];
						val = it;
					}
				}

				set.erase(val);
				set.insert(pages[i]);
				page_faults++;
			}

			indexes[pages[i]] = i;
		}
	}

	return page_faults;
}

int main()
{
	int pages[] = {7, 0, 1, 2, 0, 3, 0, 4, 2, 3, 0, 3, 2, 1};
	int n = sizeof(pages)/sizeof(pages[0]);
	int capacity = 4;
	cout << "The nuber of page faults : " << pageFaults(pages, n, capacity);
	return 0;
}
