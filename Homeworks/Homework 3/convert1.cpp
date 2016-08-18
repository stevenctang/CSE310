#include <iostream>
#include <vector>

using namespace std;

int main(){
	int a = 7;
	int b, c;
	vector<int>v;
	char response;
	bool finished = true;
	cout << "Enter a number" << endl;
	cin >> b;
	/*
	cout << "Would you like to convert a number to binary?" << endl;
	cout << "Enter y for yes and n for no" << endl;
	cin >> response;
	//while (response == y)
	cout << "Enter the number you would like to convert to binary" << endl;
	cin >> a;
	*/
	while( c != 0 ){
		c = b / 2;
		if( c == 0 ){
			cout << "Quotient is 0" << endl;
			finished = true;
			return 0;
		}
		a = b % 2;
		v.push_back(a);
		b = c;
	}
	cout << "The binary number is: " << endl;
	for(int i = 0; i < v.size(); i++)
		cout << v[i];

}
