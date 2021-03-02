function [fft_feature] = extract_fft(sig,SR)
    L = size(sig,1);
    Y = fft(sig);
    P2 = abs(Y/L);
    P1 = P2(1:round(L/2)+1);
    P1(2:end-1) = 2*P1(2:end-1);
    f = SR * (0:round(L/2))/L;
  
    block_11 = mean(P1(f<=50));
    block_21 = mean(P1(f>50 & f<=100));
    block_31 = mean(P1(f>100 & f<=150));
    block_41 = mean(P1(f>150 & f<=200));
    
    block_12 = max(P1(f<=50));
    block_22 = max(P1(f>50 & f<=100));
    block_32 = max(P1(f>100 & f<=150));
    block_42 = max(P1(f>150 & f<=200));
    
    block_13 = median(P1(f<=50));
    block_23 = median(P1(f>50 & f<=100));
    block_33 = median(P1(f>100 & f<=150));
    block_43 = median(P1(f>150 & f<=200));
    
    fft_feature = [block_11,block_21,block_31,block_41,block_12,block_22,block_32,block_42,block_13,block_23,block_33,block_43];
    return;
end