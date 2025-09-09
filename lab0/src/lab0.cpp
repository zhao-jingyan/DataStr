#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;

int main() {

    /* read target */
    int target;
    cin >> target;

    /* read array */
    vector<int> arr;
    int tmp;
    while(cin >> tmp) {
        arr.push_back(tmp);
        if(cin.peek() == '\n') break;
    }

    /* Find the indices of two numbers in the array whose sum equals the target value */
    for(int i = 0; i < arr.size() - 1; i++) {
        for(int j = i + 1; j < arr.size(); j++) {
            if(arr[i] + arr[j] == target) {
                cout << i << ' ' << j << endl;
                break;
            }
        }
    }

    return 0;

}