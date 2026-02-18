#include <iostream>
#include <cstdlib>
using namespace std;

int main(){
    cout << "Content-type:text/html\n\n";

    string data = getenv("QUERY_STRING");
    int sisi = 0;
    if (data.find("sisi=") != string::npos) {
        sisi = stoi(data.substr(5));
    }
    int luas = sisi * sisi;
    cout << "<html><body>";
    cout << "<h2>Hasil Perhitungan</h2>";
    cout << "Luas Persegi: " << luas;
    cout << "</body></html>";

    return 0;
}