#include <algorithm>
#include <fstream>
#include <iostream>
#include <string>
#include <vector>

constexpr int W = 7;

using namespace std;

string decrypt(string enc, const vector<int>& perm) {
	const size_t len = enc.length();
	string tmp;

	tmp = "";
	for (int i = 0; i < len; i += W) {
		for (int j = 0; j < W; j++) {
			tmp += enc[i + perm[j]];
		}
	}
	enc = tmp;
	enc = enc.substr(len - 1, 1) + enc.substr(0, len - 1);
	tmp = "";
	for (int i = 0; i < len / 2; i++) {
		tmp += enc[i];
		tmp += enc[len / 2 + i];
	}
	enc = tmp;
	enc = enc.substr(len - 1, 1) + enc.substr(0, len - 1);

	return enc;
}

string decode(string enc, const vector<int>& perm, int l) {
	for (int i = 0; i < l; i++) {
		enc = decrypt(enc, perm);
	}
	return enc;
}

int main(void) {
	ifstream ifs("./flag.enc");
	string enc;
	ifs >> enc;

	vector<int> perm;
	for (int i = 0; i < W; i++) {
		perm.emplace_back(i);
	}

	int cnt = 0;
	do {
		cout << cnt++ << endl;
		for (int l = 0; l <= 1337; l++) {
			string mes = decode(enc, perm, l);
			const string needle = "ASIS{";
			if (equal(needle.begin(), needle.end(), mes.begin())) {
				cout << mes << endl;
			}
		}
	} while (next_permutation(perm.begin(), perm.end()));

	return 0;
}
