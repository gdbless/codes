function BB = Bernstein(n, u)
    % ����ʽ��5.4��~��5.5��
    % һ�� n �ε� Bernstein �������� n + 1 ��
    % ������Բ��� u ������ n + 1 �� Berbstein ��������ֵ
    % ���������������� BB ��
    if (n == 0)
        error('n �������0')  % Bernstein ���������������� 1
    else
        mnj = 1;
        for j = 1:n  % ���� n �Ľ׳�
            mnj = mnj * j;
        end
    end

    for i = 0:n
        zij = 1;
        a = 1;
        if i >= 1
            for j = 1 : i
                zij = zij * j;  % ���� i �Ľ׳�
                a = a * u;  % ���� u �� i ����
            end
        end

        znij = 1;
        b = 1;
        if n - i >= 1
            for j = 1:n-i
                znij = znij * j;  % ���� n - i �Ľ׳�
                b = b * (1 - u);  % ���� 1-u �� n - i ����
            end
        end

        Cin = mnj / (zij * znij);  % ���������
        BB(i + 1) = Cin * a * b;  % ���� i ��Bernstein��������ֵ�������� BB
        % �� matlab �У��������Ŵ� 1 ��ʼ
    end  % for i = 0:n