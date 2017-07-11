%membangkitkan individu
Npop = 4;
individu = floor(rand(Npop,5)*2);
%ukuran individu uA = 5 5
for iterasi = 1 : 30%-------------------------------
    
uA=size(individu); 
%proses looping penghitungan nilai biner ke integer dengan uA(1) = 4, uA(2) = 5
for i=1:uA(1)
    x(i)=0;
    for j=1:uA(2)
		%jika gen bernilai 1
        if individu(i,j)==1	
		x(i)= x(i)+(2^(uA(2)-j));
        end;
    end;
end;
sizeX = size(x);
%menghitung fitness function
for i = 1 : sizeX(2)
 	fitness(i) = x(i)^2;
end

%Simpan Max Fitness
max_fit(iterasi)= max(fitness);%---------------------
generasi(iterasi)= iterasi;%-----------------------------------

sumF = sum(fitness); 
probfit = fitness/sumF; %probabilitas fitness
probKum = cumsum(probfit); %probabilitas kumulatif
RN = rand(1,Npop);
newInd = individu;
%proses pemilihan parent
for i = 1 : Npop
    for j = 1 : Npop
        if(RN(i)<=probKum(j))
           newInd(i,:)=individu(j,:);
           break;
        end
    end
end

parent = newInd;
uInd = size(newInd,1);
sumGen = size(newInd,2);
j=1;
Pc=0.75;
RN = rand(1,uInd);
%proses memilih kromosom yang akan di pindah silang
for i = 1 : uInd
    if RN(i) < Pc
        Pindex(j)= i;
        j = j+1;
    end    
end
 
u_index = size(Pindex,2);
 
%jika Pindex ganjil maka dihilangkan 1
if mod(u_index,2)~=0
    u_index = u_index - 1;
end

%proses crossover
for i =1 : 2 : u_index
  n = Pindex(i);
  m = Pindex(i+1);
  TP = 1 + round(rand*(sumGen-2));
  newInd(n,:)=[parent(n, 1:TP),parent(m,TP+1:sumGen)];     	
  newInd(m,:)=[parent(m, 1:TP),parent(n,TP+1:sumGen)];
end
%MUTASI
[m n] = size(newInd);

%banyaknya gen yang akan di mutasi
Pm=0.1;
sumMut = Pm*(m*n);
 
for i = 1 : sumMut
    k = fix(1+m*rand);
    l = fix(1+n*rand);
    if newInd(k,l) == 0
        newInd(k,l) = 1;
    else
        newInd(k,l) = 0;
    end
end
individu =  newInd; %------------------
end %-------------------%plot GA-----------------
plot(generasi,max_fit)