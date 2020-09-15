
https://leetcode.com/problems/split-array-largest-sum/

## code_good  dp

https://leetcode-cn.com/problems/split-array-largest-sum/solution/fen-ge-shu-zu-de-zui-da-zhi-by-leetcode-solution/


not efficiency

```
Runtime: 1640 ms, faster than 5.06% of C++ online submissions for Split Array Largest Sum.
Memory Usage: 8.6 MB, less than 5.02% of C++ online submissions for Split Array Largest Sum.
```

```cpp
class Solution {
public:
    int splitArray(vector<int>& nums, int m) {
        int len = nums.size();
        vector<vector<long long> > dp(len + 1, vector<long long>(m + 1, LLONG_MAX));

        vector<long long> preSum(len + 1, 0);
        for (int i = 0; i < len; ++i) {
            preSum[i + 1] = preSum[i] + nums[i];
        }

        dp[0][0] = 0;
        for (int i = 1; i <= len; ++i) {
            for (int j = 1; j <= min(i, m); ++j) {
                for (int k = 0; k < i; ++k) {
                    dp[i][j] = std::min(dp[i][j], std::max(dp[k][j - 1], preSum[i] - preSum[k]));
                }
            }
        }

        return dp[len][m];
    }
};
```

## code_good binary search

https://leetcode-cn.com/problems/split-array-largest-sum/solution/er-fen-cha-zhao-by-coder233-2/  

```
Runtime: 4 ms, faster than 70.24% of C++ online submissions for Split Array Largest Sum.
Memory Usage: 7.1 MB, less than 82.93% of C++ online submissions for Split Array Largest Sum.
```

```cpp
class Solution {
public:
    int splitArray(vector<int>& nums, int m) {
        long long l = nums[0], h = 0;
        for (auto i : nums) {
            l = l > i ? l : i;
            h += i;
        }

        while (l < h) {
            long long mid = l + ((h - l) >> 1);
            long long tempSum = 0;
            int count = 1;
            for (auto i : nums) {
                tempSum += i;
                
                if (tempSum > mid) {
                    tempSum = i;
                    ++count;
                }
            }

            if (count > m) {
                l = mid + 1;
            }
            else {
                h = mid;
            }
        }

        return l;
    }
};
```

