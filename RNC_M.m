P=zeros(M,N); %����Ƕ������ת�Ƹ��ʾ���
for i=1:M
    for j=1:N
        if j==i
            P(i,j)=0;
        else
            P(i,j)=-A(i,j)/A(i,i);
        end
    end
end

X(1)=2;  %��ʼ״̬
tsum(1)=0; %��ʼʱ��
for i=1:1000000 
    t(i)=exprandom(-A(X(i),X(i))); %�����ڸ�״̬�Ķ���ʱ��
    tt=tsum(i)+t(i);  %��һ����Ծʱ��
    if tt>=T+3
        break;
    end
    tsum(i+1)=tt;
    c=rand(1,1);  %�����µ�״̬
    j=0;
    sum=0;
    for j=1:N
        sum=sum+P(X(i),j);
        if c<=sum;
            X(i+1)=j;
            break;
        end
    end
end


[m n]=size(X);
tp=1;
tr=0;
xx(tp,1)=0;
xx(tp,2)=X(1);
for i=1:n-1
    for t1=tr:0.001:100
        xx(tp,1)=t1;       
        if t1<=tsum(i+1);            
            xx(tp,2)=X(i);
            tp=tp+1;
            continue;
        else
            xx(tp,2)=X(i+1);
            tp=tp+1;
            tr=t1;
            break;
        end
    end
end


