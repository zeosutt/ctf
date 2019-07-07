platforms = ['WIN32', 'WIN16', 'WIN64', 'WINCE', 'SUNOS', 'MAC68', 'MACPP', 'MACIN', 'LINUX', 'HP-UX', 'WEBTV', 'FREEB'];
characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';

for (var b = 0; b < platforms.length; b++) {
	for (var t1 = 0; t1 < 2; t1++) {
		for (var t2 = 0; t2 < 2; t2++) {
			for (var t3 = 0; t3 < 2; t3++) {
				for (var t4 = 0; t4 < 2; t4++) {
					for (var t5 = 0; t5 < 2; t5++) {
						for (var c1 = 0; c1 < characters.length; c1++) {
							for (var c2 = 0; c2 < characters.length; c2++) {
								for (var t6 = 0; t6 < 2; t6++) {
									for (var t7 = 0; t7 < 2; t7++) {
										for (var t8 = 0; t8 < 2; t8++) {
											for (var t9 = 0; t9 < 3; t9++) {
												aa = platforms[b] + t1 + t2 + t3 + t4 + t5 + characters[c1] + characters[c2] + t6 + t7 + t8 + t9;
												aaa = T.d0(a, aa)
												try {
													console.log(decodeURIComponent(escape(aaa)))
													console.log(aa)
												} catch (a) {
												}
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}
}
