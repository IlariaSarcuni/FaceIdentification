% Supponendo di avere:
% - X, Y, Z: matrici della surface_z (stessa dimensione)
% - shape_index: matrice shape index (stessa dimensione di Z)
% - lm: tabella dei landmark con colonne Acronym, X, Y, Z
clc, clear all, close all

base_path = '\Bosphorus\Dataset';
mesh_path = '\Bosphorus\lms';
%%
descr = geometric_descriptors(Z);
K=descr.K;

% 1. Calcola la linea mediana (colonna centrale)
[nRows, nCols] = size(X);
[~, col_med] = min(abs(mean(X,1) - mean(X(:))));
X_med = X(:, col_med);
Y_med = Y(:, col_med);
Z_med = Z(:, col_med);
K_med = K(:, col_med);


% 2. Trova i landmark delle sopracciglia interne e occhi interni
idx_iebsx = find(strcmp(lm.Acronym, 'iebsx'));
idx_iebdx = find(strcmp(lm.Acronym, 'iebdx'));
idx_ensx  = find(strcmp(lm.Acronym, 'ensx'));
idx_endx  = find(strcmp(lm.Acronym, 'endx'));



ymin = min([lm.cord_Y([idx_iebsx, idx_iebdx, idx_ensx, idx_endx])]);
ymax = max([lm.cord_Y([idx_iebsx, idx_iebdx, idx_ensx, idx_endx])]);
xmin = min([lm.cord_X([idx_iebsx, idx_iebdx, idx_ensx, idx_endx])]);
xmin=X_med;
xmax = X_med;



% Trova gli indici delle righe e colonne che cadono nella bounding box
rows = find(any(Y >= ymin & Y <= ymax, 2));
cols = find(any(X >= xmin & X <= xmax, 1));
mask = X >= xmin & X <= xmax & Y >= ymin & Y <= ymax;
K_bbox = K;
K_bbox(~mask) = NaN;  % Imposta a NaN i punti fuori dalla bounding box


% Trova il minimo e la sua posizione


indice=find(K_bbox==max(K_bbox(K_bbox<0)));
%indice=find(K_bbox==min(abs(K_bbox)));
[row_min, col_min]= ind2sub(size(K_bbox),indice);


% Ottieni le coordinate x e y corrispondenti
x_min = X(row_min, col_min);
y_min = Y(row_min, col_min);
z_min = Z(row_min, col_min);
Sellion_X = x_min;
Sellion_Y = y_min;
Sellion_Z = z_min;


% Salva nelle variabili della tabella dei landmark
lm.X(strcmp(lm.Acronym, 'se')) = mean(Sellion_X(:));
lm.Y(strcmp(lm.Acronym, 'se')) = mean(Sellion_Y(:));
lm.Z(strcmp(lm.Acronym, 'se')) = mean(Sellion_Z(:));

%%
% (Opzionale) Visualizza la linea mediana e il Sellion trovato
figure; hold on;
%plot3(X_med, Y_med, Z_med, 'k-', 'LineWidth', 1);
plot3(Sellion_X, Sellion_Y, Sellion_Z, 'ro', 'MarkerSize', 10, 'LineWidth', 2);
surf(X, Y, Z, 'EdgeColor', 'none');
colormap gray;
axis equal;
hold on;
title('Sellion localizzato sulla linea mediana');
xlabel('X'); ylabel('Y'); zlabel('Z'); grid on; axis equal;


%%
figure; hold on;
%plot3(X_med, Y_med, Z_med, 'k-', 'LineWidth', 1);
scatter3(mean(Sellion_X(:)), mean(Sellion_Y(:)), mean(Sellion_Z(:)), ...
    50, ...              % Tamaño del marcador
    'r', ...             % Color de relleno
    'filled'); 

mesh(X, Y, Z);

hold on;
title('Sellion estimation'); grid on;