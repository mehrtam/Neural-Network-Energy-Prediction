function PlotResults(t,y,name)

    figure;
    
    %plot t and y
    subplot(2,2,1);
    plot(y,'k');
    hold on;
    plot(t,'r:');
    legend('Outputs','Targets');
    title(name);
    
    %correlation Plot
    subplot(2,2,2);
    plot(t,y,'ko');
    hold on;
    xmin=min(min(t),min(y));
    xmax=max(max(t),max(y));
    plot([xmin xmax],[xmin xmax],'b','LineWidth',2);
    R=corr(t',y');
    title(['R = ' num2str(R)]);
   
    %error plot
    subplot(2,2,3);
    e=t-y;
    plot(e,'b');
    legend('Error');
    mse=mean(e.^2);
    rmse=sqrt(mse);
    title(['MSE = ' num2str(mse) ', RMSE = ' num2str(rmse)]);
    
    %error histogram
    subplot(2,2,4);
    histfit(e,60);
    emean=mean(e);
    estd=std(e);
    title(['\mu = ' num2str(emean) ', \sigma = ' num2str(estd)]);
    
end