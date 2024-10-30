LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY comparator IS
  PORT (
    a1, a2, a3, a4, a5 : IN STD_LOGIC;
    b1, b2, b3, b4, b5 : IN STD_LOGIC;
    s1, s2, s3         : OUT STD_LOGIC
  );
END comparator;

ARCHITECTURE behaviour OF comparator IS
  SIGNAL e1, e2, e3, e4, e5, and1, and2, and3, and4, and5, i1, i2, i3, i4, i5, res1, res2, res3 : STD_LOGIC;
BEGIN

  -- Comprovem per cada bit, si es diferent
  e1 <= a1 XNOR b1;
  e2 <= a2 XNOR b2;
  e3 <= a3 XNOR b3;
  e4 <= a4 XNOR b4;
  e5 <= a5 XNOR b5;

  -- Comprovem per cada bit de A, si es major pel bit del mateix pes de B (A = 1, B = 0)
  and1 <= a1 AND NOT b1;
  and2 <= a2 AND NOT b2;
  and3 <= a3 AND NOT b3;
  and4 <= a4 AND NOT b4;
  and5 <= a5 AND NOT b5;

  -- Imposem l'ordre del pes dels bits, i5 nomes transmitira e5 si i4 esta activat, i aixi successivament
  -- (la condicio que s'activi una sortida i qualsevol, es que els bits anteriors siguin iguals)
  i1 <= e1;
  i2 <= i1 AND e2;
  i3 <= i2 AND e3;
  i4 <= i3 AND e4;
  i5 <= i4 AND e5;

  --(A es mes gran que B si un dels bits bits es 1 i el del B es zero (andX) tenint en compte l'ordre dels bits iX)
  res1 <= and1 OR (i1 AND and2) OR (i2 AND and3) OR (i3 AND and4) OR (i4 AND and5);

  --(A es igual que B si tots els bits son iguals (els nombres son iguals fins el bit x si iX es true)
  res2 <= i5;

  -- (B es major que A si A /= B i A no es major que B)
  res3 <= NOT res1 AND NOT res2;

  s1 <= res1;
  s2 <= res2;
  s3 <= res3;
END behaviour;
