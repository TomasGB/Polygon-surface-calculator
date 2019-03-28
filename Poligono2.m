function [ ] = Poligono2(v)
n=size(v,1);
disp('ingrese de que forma quiere encontrar el area:')
f=input('1:polyarea(), 2:formula de Gauss,3:proceso.  ');
switch f
    case 1
        for i=1:n
		x(i)=v(i,1);
		y(i)=v(i,2);
        end 
        a=polyarea(x,y);
        hold on
        plot(x,y)
        plot([x(1),x(n)],[y(1),y(n)])
        hold off
        disp (['el area del polígono con' ' ' num2str(n) ' ' 'vértices, es:' ' ' num2str(a)])
    case 2
        for i=1:n
		x(i)=v(i,1);
		y(i)=v(i,2);
        end 
        suma=0;
        suma2=0;
        for i=1:n-1
		suma=suma+(x(i)*y(i+1));
		suma2=suma2+(x(i+1)*y(i));
        end
        suma=suma+x(n)*y(1);
        suma2=suma2+x(1)*y(n);
        a=(1/2)*abs((suma)-(suma2));
        hold on
        plot(x,y)
        plot([x(1),x(n)],[y(1),y(n)])
        hold off
        disp (['el area del polígono con' ' ' num2str(n) ' ' 'vértices, es:' ' ' num2str(a)])
    case 3
        for i=1:n
            x(i)=v(i,1);
            y(i)=v(i,2);
        end 
            auxminx=x(i);
            auxmaxx=x(i);
        for i=1:n 
            if x(i)<auxminx
                auxminx=x(i);
            end
        end
        for i=1:n 
           if x(i)>auxmaxx
                auxmaxx=x(i);
           end
        end
        auxminy=y(i);
        auxmaxy=y(i);
        for i=1:n 
           if y(i)<auxminy
                auxminy=y(i);
           end
        end
        for i=1:n 
           if y(i)>auxmaxy
                auxmaxy=y(i);
           end
        end
        v1=[auxminx,auxminy];
        v2=[auxminx,auxmaxy];
        v3=[auxmaxx,auxminy];
        v4=[auxmaxx,auxmaxy];
        
        arearec=((norm(v3-v1))*(norm(v2-v1)));
        
        N=input('ingrese el numero de puntos que desea: ');
        b=rand(N,2);
        for i=1:N
            xq(i)=b(i,1);
            yq(i)=b(i,2);
        end
        p=[xq;yq];
        p_1=(((xq .*((auxmaxx-auxminx).*(auxmaxy-auxminy)))));
        p_2=(((yq .*((auxmaxx-auxminx).*(auxmaxy-auxminy)))));
        d=inpolygon(p_1,p_2,x,y); 
        prop=(sum(d)/N);
        a=(prop*arearec);
        
        hold on
        plot([v1(1),v2(1)],[v1(2),v2(2)])
        plot([v3(1),v4(1)],[v3(2),v4(2)])
        plot([v2(1),v4(1)],[v2(2),v4(2)])
        plot([v1(1),v3(1)],[v1(2),v3(2)])
        plot(x,y,'r')
        plot([x(1),x(n)],[y(1),y(n)],'r')
        scatter(p_1,p_2,'b','filled')
        hold off     
        disp (['el area aproximada del polígono con' ' ' num2str(n) ' ' 'vértices, es:' ' ' num2str(a)])
end
%%A medida que N va tomando números mayores, el polígono se asemeja a una
%%circunsferencia que cubre una aproximación a la totalidad del cuadrado
%%envolvente,asumiendo como valor de área el de éste.

end

