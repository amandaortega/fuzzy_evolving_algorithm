function [ RMSE ] = wyniki( y_przewidywane, y_prawdziwe, R_w_czasie, opis, nr, S, S_min, S_max, S_podmiana, S_nowy )
% opis = [ nazwa_danych algorytm R r OMEGA z_gwiazdka x ]
    dane = opis{1};
    algorytm = opis{2};
    R = opis{3};
    r = opis{4};
    OMEGA = opis{5};

    K = length(y_prawdziwe);

    out = [ y_przewidywane, y_prawdziwe, (y_przewidywane - y_prawdziwe)];
    
    RMSE = sqrt(mean(out(:,3).^2));
    
    % normlny
        filename = ['G:\mgr\wykresy\' dane '\' dane '-' algorytm '-' TimeStamp '-' num2str(nr)];

        plot([0:K-1], out(:,1), 'g',[0:K-1], out(:,2), '--b');
        set(gcf, 'visible','off');
        title(['Wykres wartosci przewidywanej, prawdziwej (' dane ' - ' algorytm ')']);
        xlabel('nr danej przychodzacej');
        ylabel('Wyniki');
        legend('y przewidywane','y');

        MyBox = text(0.5,0.5,['algorytm=', algorytm, char(10), 'RMSE=', num2str(RMSE) char(10) 'R=' num2str(R) char(10) 'r=' num2str(r) char(10) '\Omega=' num2str(OMEGA)]);
        set(MyBox,'Units','Normalized');
        set(MyBox,'Position',[0.02,0.9]);

        set(gcf, 'PaperSize', [5,5]); %Set the paper to have width 5 and height 5.
        saveas(gcf, filename, 'png') %Save figure
	
     % normlny i R w czasie
        filename = ['G:\mgr\wykresy\' dane '\' dane '-' algorytm '-' TimeStamp '-R-i-y' num2str(nr)];

        plotyy([0:K-1], [out(:,1), out(:,2)],[0:K-1], R_w_czasie,'semilogy','plot' );
        set(gcf, 'visible','off');
        title(['y-greki i R (' dane ' - ' algorytm ')']);
        xlabel('nr danej przychodzacej');
        ylabel('Wyniki');
        legend('y','y przewidywane','R');

        MyBox = text(0.5,0.5,['algorytm=', algorytm, char(10), 'RMSE=', num2str(RMSE) char(10) 'R=' num2str(R) char(10) 'r=' num2str(r) char(10) '\Omega=' num2str(OMEGA)]);
        set(MyBox,'Units','Normalized');
        set(MyBox,'Position',[0.02,0.9]);

        set(gcf, 'PaperSize', [5,5]); %Set the paper to have width 5 and height 5.
        saveas(gcf, filename, 'png') %Save figure
    
    
    % R w czasie
        filename = ['G:\mgr\wykresy\' dane '\' dane '-' algorytm '-' TimeStamp 'R-w-czasie' '-' num2str(nr)];

        plot([0:K-1], R_w_czasie, 'g');
        set(gcf, 'visible','off');
        title(['Liczba klast�rw w czasie (' dane ' - ' algorytm ')']);
        xlabel('nr danej przychodzacej');
        ylabel('Liczba klastr�w');
        legend('R');

        MyBox = text(0.5,0.5,['algorytm=', algorytm, char(10), 'RMSE=', num2str(RMSE) char(10) 'R=' num2str(R) char(10) 'r=' num2str(r) char(10) '\Omega=' num2str(OMEGA)]);
        set(MyBox,'Units','Normalized');
        set(MyBox,'Position',[0.02,0.9]);

        set(gcf, 'PaperSize', [5,5]); %Set the paper to have width 5 and height 5.
        saveas(gcf, filename, 'png') %Save figure
    
	% R w czasie - delta y
        filename = ['G:\mgr\wykresy\' dane '\' dane '-' algorytm '-' TimeStamp 'R-w-czasie-delta' '-' num2str(nr)];

        plotyy([0:K-1], R_w_czasie,[0:K-1], out(:,3),'semilogy','plot');
        set(gcf, 'visible','off');
        title(['Liczba klast�rw w czasie (' dane ' - ' algorytm ')']);
        xlabel('nr danej przychodzacej');
        ylabel('Liczba klastr�w');
        legend('R');

        MyBox = text(0.5,0.5,['algorytm=', algorytm]);
        set(MyBox,'Units','Normalized');
        set(MyBox,'Position',[0.02,0.9]);

        set(gcf, 'PaperSize', [5,5]); %Set the paper to have width 5 and height 5.
        saveas(gcf, filename, 'png') %Save figure
    
    % roznica
        filename = ['G:\mgr\wykresy\' dane '\' dane '-' algorytm '-' TimeStamp '-roznica'  '-' num2str(nr)];

        plot([0:K-1], out(:,3), 'r');
        set(gcf, 'visible','off');
        title(['R�znica miedzy przewidywanym wyjsciem a prawdziwym wyjsciem (' dane ' - ' algorytm ')']);
        xlabel('nr danej przychodzacej');
        ylabel('R�znica');
        legend('y - y przewidywane');

        MyBox = text(0.5,0.5,['algorytm=', algorytm, char(10), 'RMSE=', num2str(RMSE) char(10) 'R=' num2str(R) char(10) 'r=' num2str(r) char(10) '\Omega=' num2str(OMEGA)]);
        set(MyBox,'Units','Normalized');
        set(MyBox,'Position',[0.02,0.9]);

        set(gcf, 'PaperSize', [5,5]); %Set the paper to have width 5 and height 5.
        saveas(gcf, filename, 'png') %Save figure
  
    % S min max
        filename = ['G:\mgr\wykresy\' dane '\' dane '-' algorytm '-' TimeStamp '-s-min-max'  '-' num2str(nr)];

        smi=cell2mat(S_min);
        sma= cell2mat(S_max);
        s=cell2mat(S);
        p=cell2mat(S_podmiana);
        n=cell2mat(S_nowy);
        plot([0:K-1], smi, '-*r',[0:K-1], sma, ':.g',[0:K-1], s, '--ob',[0:K-1], p,'+c',[0:K-1], n,'xm');
        set(gcf, 'visible','off');
        title([' (' dane ' - ' algorytm ')']);
        xlabel('nr danej przychodzacej');
        ylabel('S');
        legend('S min','S max','S');

        MyBox = text(0.5,0.5,['algorytm=', algorytm, char(10), 'RMSE=', num2str(RMSE) char(10) 'R=' num2str(R) char(10) 'r=' num2str(r) char(10) '\Omega=' num2str(OMEGA)]);
        set(MyBox,'Units','Normalized');
        set(MyBox,'Position',[0.02,0.9]);

        set(gcf, 'PaperSize', [5,5]); %Set the paper to have width 5 and height 5.
        saveas(gcf, filename, 'png') %Save figure
    
    
end