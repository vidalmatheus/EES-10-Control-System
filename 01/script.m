%% Importando os dados 
%data4a = importdata('data_4a.txt');
%data4b = importdata('data_4b.txt');
%data4c = importdata('data_4c.txt');

%% Velocidade angular
Ts = 0.013260; % em s
sample = data4a(2:end,1); % coluna 1 é o sample e coluna 2 é o tempo 
% data_4a
w4a = (diff(data4a(:,5))*(2*pi/16000))/Ts;
% data_4b
w4b = (diff(data4b(:,5))*(2*pi/16000))/Ts;
% data_4c
w4c = (diff(data4c(:,5))*(2*pi/16000))/Ts;

% Agora com 0 pesos
% data_0a
w0a = (diff(data4a(:,5))*(2*pi/16000))/Ts;
% data_0b
w0b = (diff(data4b(:,5))*(2*pi/16000))/Ts;
% data_0c
w0c = (diff(data4c(:,5))*(2*pi/16000))/Ts;

%% Plotar os gráficos da velocidade e aceleração angulares
% Vamos descobrir qual é o comportamento: atrito seco ou viscoso
t_w = Ts*sample;
% 4 pesos
% data_4a
grafW4a = plot (t_w,w4a);
title('Velocidade Angular X Tempo [4 pesos]');
xlabel('t (s)');
ylabel('\omega (rad/s)');
hold on

% data_4b
grafW4b = plot (t_w,w4b);

% data_4c
grafW4c = plot (t_w,w4c);

legend('Medida A','Medida B', 'Medida C');

% 0 pesos
figure;
% data_0a
grafW0a = plot (t_w,w0a);
title('Velocidade Angular X Tempo [0 pesos]');
xlabel('t (s)');
ylabel('\omega (rad/s)');
hold on

% data_0b
grafW0b = plot (t_w,w0b);

% data_0c
grafW0c = plot (t_w,w0c);

legend('Medida A','Medida B', 'Medida C');

%% Curve Fitting 
% Como esperado o comportamento é de atrito seco permanente. 
% Logo, vamos fazer o fitting com o app Curve Fitting.
% Escolhemos o primerio: w4a e w0a

% 4 pesos
[~,index4] = max(w4a);
w4Acelerando = w4a(1:index4);
w4Desacelerando = w4a(index4:188);
t4Acelerando = t_w(1:index4);
t4Desacelerando = t_w(index4:188);

% 0 pesos
[~,index0] = max(w0a);
w0Acelerando = w0a(1:index0);
w0Desacelerando = w0a(index0:188);
t0Acelerando = t_w(1:index0);
t0Desacelerando = t_w(index0:188);

