% Rules for successful treatment
successful_treatment(_, Age, Time, Number_of_warts, _, _) :- 
    Age =< 30, 
    Time =< 6, 
    Number_of_warts =< 5.

successful_treatment(_, Age, _, _, Type, _) :- 
    Age > 30, 
    Type =< 2.

% Rules for unsuccessful treatment
unsuccessful_treatment(_, Age, Time, Number_of_warts, _, _) :- 
    Age =< 30, 
    Time =< 6, 
    Number_of_warts > 5.

unsuccessful_treatment(_, Age, Time, _, _, _) :- 
    Age =< 30, 
    Time > 6.

unsuccessful_treatment(_, Age, _, _, Type, _) :- 
    Age > 30, 
    Type > 2.

% Query to get patient details and classify treatment
classify_treatment :-
    write('Enter the following patient details:'), nl,
    write('Sex: '), read(Sex),
    write('Age: '), read(Age),
    write('Time: '), read(Time),
    write('Number of warts: '), read(Number_of_warts),
    write('Type: '), read(_),
    write('Area: '), read(_),
    
    ( successful_treatment(Sex, Age, Time, Number_of_warts, _, _) 
      -> write('The treatment is likely to be successful.')
      ; unsuccessful_treatment(Sex, Age, Time, Number_of_warts, _, _) 
        -> write('The treatment is unlikely to be successful.')
        ; write('Cannot determine the likelihood of a successful treatment with the given details.')
    ).