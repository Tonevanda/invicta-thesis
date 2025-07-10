// Example file for local development and testing
// This file demonstrates the template with a complete thesis example
// To use: copy this as your starting point and modify as needed

// Use this import when the package is published to Typst Universe
// // #import "@preview/feup-thesis:1.0.0": *

// For local development, use:
#import "../src/lib.typ": *

#show: template.with(
  // Document metadata
  title: "Example FEUP Thesis",
  author: "John Doe",
  degree: "Master in Informatics and Computing Engineering",
  supervisor: "Prof. Jane Smith",
  second-supervisor: "Prof. Bob Johnson",
  
  // Dates and copyright
  thesis-date: none, // Will use current date
  copyright-notice: "John Doe, 2025",
  
  // Visual elements
  logo: "figures/uporto-feup.png", // Set to "figures/uporto-feup.png" if you have the logo file
  additional-front-text: none,
  
  // Committee information (example for final version), use none otherwise
  committee-text: "Approved in oral examination by the committee:",
  committee-members: (
    (role: "President", name: "Prof. Maria Santos"),
    (role: "Referee", name: "Prof. Carlos Silva"),
    (role: "Referee", name: "Prof. Ana Costa"),
  ),
  signature: false,
  
  dedication-text: "To my family, whose unwavering support has been the foundation of my academic journey.",
  
  // Configuration options
  stage: "final", // This is a final version
  language: "en",
  degree-type: "meic",
  has-unsdg: false, // Include UN SDG section
  has-quote: true,
  bib-style: "ieee",
)

// Resumo
#set page(numbering: "i")
#counter(page).update(1)
#heading(level: 1, numbering: none)[Resumo]

#include "prologue/resumo.typ"

// Abstract
#heading(level: 1, numbering: none)[Abstract]

#include "prologue/abstract.typ"

// UN-SDG (example)
#heading(level: 1, numbering: none)[United Nations Sustainable Development Goals]

#include "prologue/unsdg.typ"

// Acknowledgments
#heading(level: 1, numbering: none)[Acknowledgments]

#include "prologue/acknowns.typ"

// Quote
#epigraph(
  "The best way to predict the future is to invent it.",
  "Alan Kay"
)

#dedication(
  text("To my family, whose unwavering support has been the foundation of my academic journey."),
)

#pagebreak()

// Table of Contents
#table-of-contents()

// Abbreviations
#heading(level: 1, numbering: none)[List of Abbreviations]

#table(
  columns: (1fr, 3fr),
  stroke: none,
  fill: none,
  [AI], [Artificial Intelligence],
  [API], [Application Programming Interface],
  [CNN], [Convolutional Neural Network],
  [CPU], [Central Processing Unit],
  [GPU], [Graphics Processing Unit],
  [ML], [Machine Learning],
  [NLP], [Natural Language Processing],
  [RNN], [Recurrent Neural Network],
  [SGD], [Stochastic Gradient Descent],
  [UI], [User Interface],
)

#pagebreak()

// Start main body with arabic numbering
#set page(numbering: "1")
#counter(page).update(1)

// Chapter 1

#include "chapters/1-introduction.typ"

// Chapter 2

#include "chapters/2-literature-review.typ"

// Chapter 3
#heading(level: 1)[Theoretical Foundations]

This chapter establishes the theoretical foundations for our proposed approach, including mathematical formulations and algorithmic principles.

== Problem Formulation

Let $X = {x_1, x_2, ..., x_n}$ be a dataset of input samples and $Y = {y_1, y_2, ..., y_n}$ be the corresponding target outputs. Our goal is to learn a function $f: X -> Y$ that minimizes the expected risk:

$ R(f) = integral L(y, f(x)) p(x, y) d x d y $

where $L$ is a loss function and $p(x, y)$ is the joint probability distribution.

== Proposed Architecture

Our neural network architecture consists of multiple components designed to optimize both accuracy and computational efficiency.

=== Network Structure

The network follows an encoder-decoder structure with the following key components:

1. *Input layer*: Processes raw input data
2. *Encoder layers*: Extract hierarchical features
3. *Bottleneck layer*: Compresses information
4. *Decoder layers*: Reconstruct output representation
5. *Output layer*: Produces final predictions

=== Optimization Algorithm

We propose a novel optimization algorithm that combines the benefits of adaptive learning rates with momentum-based updates.

#algorithm("Proposed Optimization Algorithm")[
  1. Initialize parameters $theta_0$
  2. *for* t = 1 to T *do*
     3. Sample mini-batch B from training data
     4. Compute gradients: $g_t = nabla_theta L(theta_t, B)$
     5. Update momentum: $m_t = beta_1 m_(t-1) + (1-beta_1)g_t$
     6. Update parameters: $theta_(t+1) = theta_t - alpha_t m_t$
  7. *end for*
]

#pagebreak()

// Chapter 4
#heading(level: 1)[Methodology]

This chapter presents our experimental methodology, including dataset preparation, implementation details, and evaluation metrics.

== Experimental Setup

We conducted experiments on several benchmark datasets to evaluate the performance of our proposed approach.

=== Datasets

We used the following datasets for evaluation:

- *CIFAR-10*: 60,000 32×32 color images in 10 classes
- *ImageNet*: Large-scale visual recognition dataset
- *Penn Treebank*: Natural language processing benchmark

=== Implementation Details

All experiments were implemented using Python and PyTorch framework. Training was performed on NVIDIA GPUs with the following specifications:

- GPU: NVIDIA RTX 3080
- Memory: 10GB GDDR6X
- CUDA version: 11.4

== Evaluation Metrics

We evaluated our approach using standard metrics:

- *Accuracy*: Percentage of correctly classified samples
- *Training time*: Wall-clock time for model training
- *Memory usage*: Peak GPU memory consumption
- *FLOPS*: Floating-point operations per second

#pagebreak()

// Chapter 5
#heading(level: 1)[Results and Analysis]

This chapter presents comprehensive experimental results and analysis of our proposed approach.

== Performance Comparison

@tab:results shows the performance comparison between our method and existing baselines across different datasets.

#figure(
  table(
    columns: (auto, auto, auto, auto),
    [Dataset], [Baseline], [Proposed], [Improvement],
    [CIFAR-10], [85.2%], [92.7%], [+7.5%],
    [ImageNet], [76.1%], [81.3%], [+5.2%],
    [Penn Treebank], [88.9%], [93.1%], [+4.2%],
  ),
  caption: [Performance comparison across datasets],
) <tab:results>

== Training Efficiency

Our proposed method shows significant improvements in training efficiency:

- 40% reduction in training time
- 30% decrease in memory usage
- Better convergence properties

#figure(
  image("figures/uporto.png", width: 70%),
  caption: [Training loss convergence comparison],
) <fig:convergence>

== Statistical Analysis

We performed statistical significance tests to validate our results:

- Paired t-test: p < 0.001
- Effect size (Cohen's d): 1.24 (large effect)
- 95% confidence interval: [0.85, 1.63]

== Discussion

The results demonstrate that our proposed approach achieves superior performance across multiple benchmarks while maintaining computational efficiency. The improvements can be attributed to:

1. *Better architecture design*: The encoder-decoder structure captures hierarchical features effectively
2. *Efficient optimization*: Our algorithm converges faster than traditional methods
3. *Regularization effects*: The bottleneck layer prevents overfitting

#pagebreak()

// Chapter 6
#heading(level: 1)[Conclusions and Future Work]

This chapter summarizes the contributions of this thesis and discusses directions for future research.

== Summary of Contributions

This thesis made the following key contributions to the field of machine learning:

1. *Novel Architecture*: Developed an innovative neural network architecture that balances accuracy and efficiency
2. *Optimization Algorithm*: Proposed a new optimization method with theoretical guarantees
3. *Empirical Validation*: Demonstrated superior performance on benchmark datasets
4. *Open Source Implementation*: Released code and models for reproducibility

== Limitations

While our approach shows promising results, several limitations should be acknowledged:

- Limited evaluation on extremely large-scale datasets
- Computational requirements still significant for resource-constrained environments
- Hyperparameter sensitivity in certain scenarios

== Future Directions

Several avenues for future research emerge from this work:

=== Technical Extensions

- Extension to other domains (e.g., natural language processing, robotics)
- Investigation of federated learning applications
- Development of automated architecture search methods

=== Practical Applications

- Integration with edge computing platforms
- Real-time inference optimization
- Domain-specific customizations

=== Theoretical Analysis

- Convergence analysis under different assumptions
- Generalization bounds for the proposed architecture
- Theoretical understanding of the optimization landscape

== Final Remarks

This thesis demonstrates the potential of combining architectural innovations with advanced optimization techniques to achieve significant improvements in machine learning performance. The proposed methods open new possibilities for developing more efficient and effective machine learning systems.

The research community can build upon this work to further advance the state-of-the-art in machine learning optimization and neural network design.

#pagebreak()

// Bibliography
#heading(level: 1, numbering: none)[Bibliography]

#bibliography("refs.bib", title: none, style: "ieee")

#pagebreak()

// Appendices
#set heading(numbering: "A.1", level: 1)
#counter(heading).update(0)

#heading[Appendix A – Implementation Details]

This appendix provides additional implementation details and code snippets.

#heading(level: 2)[Network Architecture Code]

#code-block(
```python
import torch
import torch.nn as nn

class ProposedNetwork(nn.Module):
    def __init__(self, input_dim, hidden_dim, output_dim):
        super(ProposedNetwork, self).__init__()
        self.encoder = nn.Sequential(
            nn.Linear(input_dim, hidden_dim),
            nn.ReLU(),
            nn.Linear(hidden_dim, hidden_dim // 2)
        )
        self.bottleneck = nn.Linear(hidden_dim // 2, hidden_dim // 4)
        self.decoder = nn.Sequential(
            nn.Linear(hidden_dim // 4, hidden_dim // 2),
            nn.ReLU(),
            nn.Linear(hidden_dim // 2, output_dim)
        )
    
    def forward(self, x):
        encoded = self.encoder(x)
        bottleneck = self.bottleneck(encoded)
        output = self.decoder(bottleneck)
        return output
```,
caption: "PyTorch implementation of proposed architecture"
)

#heading(level: 2)[Training Configuration]

The following hyperparameters were used for training:

- Learning rate: 0.001
- Batch size: 32
- Number of epochs: 100
- Optimizer: Adam
- Weight decay: 1e-4

#heading[Appendix B – Additional Results]

This appendix contains supplementary experimental results and analysis.

#heading(level: 2)[Detailed Performance Metrics]

#figure(
  table(
    columns: (auto, auto, auto, auto, auto),
    [Method], [Precision], [Recall], [F1-Score], [AUC],
    [Baseline 1], [0.842], [0.838], [0.840], [0.891],
    [Baseline 2], [0.856], [0.851], [0.853], [0.904],
    [Proposed], [0.925], [0.921], [0.923], [0.967],
  ),
  caption: [Detailed performance metrics on test set],
)

#heading(level: 2)[Computational Complexity]

The computational complexity of our proposed method is O(n log n) for training and O(log n) for inference, where n is the input dimension.

// End of document
