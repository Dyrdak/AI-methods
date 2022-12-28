function s = gen_echo(type)
T = 2;
fd = 80000; % ������� �������������
fs = 20000; % ������� �������
c = 1500; % �������� ������ � ����
d = 0.03; % ���������� ����� �����-����������� ����������
r = 500 + 500*rand(1); % ��������� ���������� �������� ���������� �� �������
alpha = 60*rand(1)-30; % ��������� ���������� �������� ���� �������� �������

s = randn(2,T*fd)/100; % ��������� ������������ �������

% points = [];

switch type % ����� ��������� ������ �� ���� �������
    case 1 % ��
        phi = 360*rand(1); % ��������� ���������� �������� ������� ������� ������������ �������
        for i=1:5 % ���� �������� ������ �������
            x = r*sind(alpha) + 20*i*sind(phi); % ���������� ���������� x ������� ��� ����� �������� ������� ��������� � ��������
            y = r*cosd(alpha) + 20*i*cosd(phi); % ���������� ���������� y ������� ��� ����� �������� ������� ��������� � ��������
            r_blink = sqrt(x^2 + y^2);  % ���������� ��������� �� �����
            phi_blink = atand(x/y); %  % ���������� ������� �����
            n1 = floor(r_blink / c * fd); % ���������� ������� ������� ����� � �������
            n2 = floor(n1 + 0.001 * fd); % ���������� ���������� ������� ����� � �������
            dphi = 2 * pi * fs * d / c * sind(phi_blink); % ���������� �������� ��� ����� ��������� ������������
            s(1,n1:n2) = s(1,n1:n2) + sin(2*pi*fs*(n1:n2)/fd); % ������ ����� � ������ ��� ������� ���������
            s(2,n1:n2) = s(2,n1:n2) + sin(2*pi*fs*(n1:n2)/fd + dphi); % ������ ����� � ������ ��� ������� ��������� (� ������ �������� ���)

%             points = [points [x; y]];
        end
    case 2 % ��������
        phi = alpha;
        for i=1:3
            x = r*sind(alpha) + 10*i*sind(phi);
            y = r*cosd(alpha) + 10*i*cosd(phi);
            r_blink = sqrt(x^2 + y^2);
            phi_blink = atan(x/y);
            n1 = floor(r_blink / c * fd);
            n2 = floor(n1 + 0.001 * fd);
            dphi = 2 * pi * fs * d / c * sind(phi_blink);
            s(1,n1:n2) = s(1,n1:n2) + sin(2*pi*fs*(n1:n2)/fd);
            s(2,n1:n2) = s(2,n1:n2) + sin(2*pi*fs*(n1:n2)/fd + dphi);

%             points = [points [x; y]];
        end
    case 3 % ������ ����������
        for i=1:20
            x = r*sind(alpha) + 220*rand(1);
            y = r*cosd(alpha) + 220*rand(1);
            r_blink = sqrt(x^2 + y^2);
            phi_blink = atan(x/y);
            n1 = floor(r_blink / c * fd);
            n2 = floor(n1 + 0.001 * fd);
            dphi = 2 * pi * fs * d / c * sind(phi_blink);
            s(1,n1:n2) = s(1,n1:n2) + sin(2*pi*fs*(n1:n2)/fd);
            s(2,n1:n2) = s(2,n1:n2) + sin(2*pi*fs*(n1:n2)/fd + dphi);

%             points = [points [x; y]];
        end
end

% figure, plot(points(1,:),points(2,:),"or")
% hold on;
% axis([-1000 1000 0 1000 ]);