# 梯度下降方法解决线性回归问题
# y=theta0+theta1*x1 拟合函数

# 写成矩阵形式，需注意矩阵输入的维度与输出的维度,维度对应起来

X=1:2:200; % [1,100]
y=5*X+4+randn(1,100)*20; % [1,100]
X=[ones(1,length(X));X]; # 2x100 第一行为x0（默认为1），第二行为x1
% plot(X,y);
%scatter(X,y)

theta=[0;1]; # 2x1
lr=0.0001;
m=length(X); % 100

# 迭代阀值，当两次迭代损失函数之差小于该阀值时停止迭代
epsilon0 = 10^(-4);
epsilon = 10^(-7);
error1 = 0;
error0 = 0;

function y=predictions(X,theta);
  % X=[ones(1,length(X));X]; # 2x100
  # X=X' # 100x2
  y=theta'*X; # 1x100
  % y=sum(y);
end;

flag=1;
while true;
  h=predictions(X,theta); # 1x100

  # cost function
  J=1/(2*m)*sum((h-y).^2);

  %detail0=1/m*(h-y)*X(1,:)'

  %detail1=1/m*(h-y)*X(2,:)'

  detail=1/m*((h-y)*X'); # 1x2

  theta=theta-lr*detail';
  
  # disp(theta);
  
  error1=J;
  if abs(error1-error0) < epsilon0 && flag==1;
    lr=lr*0.8;
    flag=0;
  elseif abs(error1-error0) < epsilon;
    break;
  else;
    error0 = error1;
  end;
end;

# 显示结果
disp(theta);
scatter(X(2,:),y);
hold on;
plot(X(2,:),theta'*X,'r');






