package level1;
import java.util.*;

public class lottoRank_minmax {
	public int[] solution(int[] lottos, int[] win_nums) {
        int matched=0;
        int zero=0;
        
        //1. lottos[]와 winNums[]에서 상호일치하는 숫자 갯수 구하기
        for(int lotto:lottos){
            if(lotto==0){
                zero++;
                continue;
            }
            for(int winNum:win_nums){
                if(lotto==winNum){
                    matched++;
                }
            }
        }
        
        //2. min, max 순위 결과 구하기
        int maxRank=7-(zero+matched);
        int minRank=7-matched;
        
        if(maxRank>6) maxRank=6;
        if(minRank>6) minRank=6;
        
        return new int[]{maxRank,minRank};
    }
}
