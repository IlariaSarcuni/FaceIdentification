# A Machine Learning Model for 3D Face Identification in Clinical Admission

This work proposes a **machine learning–based approach for 3D face identification** aimed at improving patient registration in clinical settings.  
The approach leverages **machine learning techniques** on 3D facial data, combining **geometric descriptors** and **Euclidean distances** to enable secure, contactless recognition and it includes a **prototype visualization** implemented in Unity, allowing interactive exploration of facial landmarks and biometric measurements, demonstrating the potential of 3D face recognition in healthcare workflows.


## Overview
The proposed model integrates **Euclidean distances** and **geometric descriptors** extracted from **RGB-D facial images**, combining shape-based and depth-based biometric information.  
Data were collected from two main sources:
- The **Bosphorus 3D Face Database**, a public dataset of 3D facial scans;
- An **internal dataset** acquired using an **Intel RealSense SR305** depth camera at *Politecnico di Torino*.

Following preprocessing and feature extraction, feature selection was performed using the **Fisher score**, and multiple classifiers were evaluated — including **SVM**, **KNN**, **Random Forest**, and **MLP**.

## Methodology
- **Feature extraction:** 3D landmarks, Euclidean distances, and geometric descriptors (shape index, curvature, and derived descriptors);  
- **Feature selection:** Fisher score applied to identify the most discriminative features;  
- **Classification:** Multi-class models trained to identify each subject from the registered database;  
- **Thresholding:** A decision threshold was introduced to detect and reject unknown individuals (open-set recognition).  

## Results
Among the tested models, the **SVM with RBF kernel** achieved the best overall performance:

| Metric | Value |
|:--------:|:--------:|
| **Recognition Rate (RR)** | 0.98 |
| **Genuine Acceptance Rate (GAR)** | 0.97 |
| **False Acceptance Rate (FAR)** | 0.00 |
| **False Reject Rate (FRR)** | 0.03 |

These results confirm that the proposed approach achieves **state-of-the-art performance** in controlled conditions, ensuring both **accuracy and security** for clinical biometric identification.

## Prototype Visualization
A **Unity-based prototype** was developed to visualize the 3D facial mesh, anatomical landmarks, and Euclidean distances interactively.  
The interface allows users to:
- Inspect 3D landmark geometry;
- Simulate the face scanning and matching process;
- Visualize patient information linked to the Electronic Health Record (EHR).

## Applications
- **Hospital and clinic admission** (secure and contactless patient check-in);  
- **Electronic Health Record integration**;  
- **Healthcare workflow automation and security**.  

## Technologies
- **Languages:** Python, Matlab 
- **Libraries:** scikit-learn, NumPy, OpenCV, MediaPipe  
- **Tools:** Unity (2022.3), Intel RealSense SDK, Blender  

## Authors
- Elisa Cevoli  
- Tatiana C. Cordoba Acosta  
- Elena L. Errico  
- Roberta Sammartano  
- Ilaria Sarcuni  

---

*This project demonstrates the feasibility of integrating machine learning-based 3D face identification into clinical admission processes, achieving high reliability, zero false acceptance, and improved procedural efficiency.*
