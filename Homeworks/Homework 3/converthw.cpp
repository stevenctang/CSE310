#include <iostream>
#include <vector>
#include <cmath>

using namespace std;

int main(){
	int a = 7;
    double b, c;
	vector<int>v;
	char response;
	bool finished = true;
    bool right = false;
	cout << "Enter a number between -1 and 1" << endl;
    while (!right){
        cin >> b;
        if ( b>= 1 || b >= -1 ){
            right = true;
        } else if ( b >= 1 || b<=1){
            cout <<"Please enter a number between -1 and 1" << endl;
            cin >> b;
        }
    }
	cin >> b;
	/*
	cout << "Would you like to convert a number to binary?" << endl;
	cout << "Enter y for yes and n for no" << endl;
	cin >> response;
	//while (response == y)
	cout << "Enter the number you would like to convert to binary" << endl;
	cin >> a;
	*/

    while( finished != true ){
		c = b * 2;
        v.push_back(c);
        if ( floor(c) == c)
            finished = true;
        else
            b = c;

    }

    //v.push_back(2);
	cout << "The binary number is: " << endl;
	for(int i = 0; i < v.size(); i++)
		cout << v[i];

    cout << endl;

}
