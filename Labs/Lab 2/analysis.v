module Circuit_of_Fig_4_2 (A,B,C,F1,F2);
    input A, B, C;
    output F1, F2;
    wire T1, T2, T3, F2_b, E1, E2, E3;
    or g1(T1,A,B,C);
    and g2 (T2, A, B, C);
    and g3 (E1, A, B);
    and g4 (E2, A, C);
    and g5 (E3, B, C);
    or g6 (F2, E1, E2, E3);
    not g7 (F2_b, F2);
    and g8 (T3, T1, F2_b);
    or g9 (F1, T2, T3);
endmodule
