clc;
clear all;
Npop =4;
Individu = floor(rand(Npop,5)*2);

for iterasi = 1 : 30%-------------------------------
%Ukuran Individu uA = 4 5
uA = size (Individu);
%Proses Looping perhitungan nilai biner ke integer dengan uA(1) = 4, uA(2)=5
for i=1:uA(1)
x(i)=0;
for j=1:uA(2)
%jika gen bernilai 1
if Individu(i,j)==1
x(i) = x(i) + (2^(uA(2)-j));
end;
end;
end;

sizeX = size(x);
%menghitung fitness function
for i = 1 : sizeX (2)
Fitness (i)= x(i)^2;
end;

max_fit(iterasi)= max(Fitness);%---------------------
generasi(iterasi)= iterasi;%-----------------------------------

%roulette Wheel
Npop = size(Individu,1);
sumF = sum(Fitness);
probfit = Fitness/sumF;
probKum = cumsum (probfit);
RN = rand(1,Npop);
newInd = Individu;
%proses pemilihan parent
for i=1:Npop
for j=1:Npop
if(RN(i)<=probKum(j))
newInd(i,:)=Individu(j,:);
break;
end;
end;
end;

parent = newInd
uInd = size (newInd)
sumGen = size(newInd,2)
j=1;
Pc=0.9;
RN = rand(1,uInd)
%proses memilih kromosom yang akan di pindah silang
for i = 1:uInd
if RN(i) < Pc
pIndex(j) = i
j=j+1
end;
end;

u_index = size (pIndex,2)
%jika pIndex ganjil maka dihilangkan 1
if mod(u_index,2)~=0
u_index = u_index - 1;
end;

%proses crossover
for i= 1:2:u_index
n= pIndex(i)
m= pIndex(i+1)
TP = 1+ round (rand*(sumGen-2))
newInd (n,:)=[parent(n, 1:TP), parent(m,TP+1:sumGen)];
newInd (m,:)=[parent(m, 1:TP), parent(n,TP+1:sumGen)];
end;
%%%%%%%%%%%%%%%%%%%%%%%%% mutasi %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[m n] = size(newInd);
Pm=0.1;
sumMut = Pm*(m*n);

for i = 1:sumMut
x = fix(1+m*rand);
y = fix(1+n*rand);
if newInd(x,y) == 0
newInd(x,y) == 1;
else
newInd(x,y) == 0;
end;
end;

%Initialisasi  penanganan grafis 2D
individu =  newInd; %------------------

end %--------------------------

%plot GA-----------------
plot(generasi,max_fit)