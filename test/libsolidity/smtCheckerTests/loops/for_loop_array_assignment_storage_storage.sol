pragma experimental SMTChecker;

contract LoopFor2 {
	uint[] b;
	uint[] c;

	function testUnboundedForLoop(uint n) public {
		b[0] = 900;
		uint[] storage a = b;
		require(n > 0 && n < 100);
		for (uint i = 0; i < n; i += 1) {
			b[i] = i + 1;
			c[i] = b[i];
		}
		assert(b[0] == c[0]);
		assert(a[0] == 900);
		assert(b[0] == 900);
	}
}
// ----
// Warning: (290-309): Assertion violation happens here
// Warning: (313-332): Assertion violation happens here
