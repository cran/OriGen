\name{FitAdmixedModelFindUnknowns}
\alias{FitAdmixedModelFindUnknowns}
\title{
Fit the OriGen model and place unknown individuals who may be admixed
}
\description{
This function fits the OriGen model and places individuals of unknown origins who may be admixed.  This function estimates admixture fractions at each location rather than the probability of coming from each location.
}
\usage{
FitAdmixedModelFindUnknowns(DataArray,SampleCoordinates,UnknownData,
	MaxGridLength=20,RhoParameter=10,LambdaParameter=100,MaskWater=TRUE)

}
%- maybe also 'usage' for other objects documented here.
\arguments{
	%\item{AlleleSurfaceOutput}{The output of \code{\link{FitOriGenModel}}}
	%\item{SNPNumber}{Integer indicating the SNP number to plot.}
	
%	\item{PlinkFileName}{Base name of Plink PED file (i.e. without ".ped" or ".map") }

%  \item{LocationFileName}{Space or tab delimited text file with Longitude and Latitude coordinates for each individual listed in the 4th and 5th columns respectively.  Note that rows should correspond to the individuals in the Plink File.  Also, this file should have a header row.}
	
	\item{DataArray}{An array giving the number of major/minor SNPs (defined as the most occuring in the dataset) grouped by sample sites for each SNP.  The dimension of this array is [2,SampleSites,NumberSNPs].}
	
	\item{SampleCoordinates}{This is an array which gives the longitude and latitude of each of the found sample sites.  The dimension of this array is [SampleSites,2], where the second dimension represents longitude and latitude respectively.}
	
	\item{UnknownData}{An array showing the unknown individuals genetic data.  The dimension of this array is [NumberUnknowns,NumberSNPs].}
	
  \item{MaxGridLength}{An integer giving the maximum number of boxes to fill the longer side of the region.  Note that computation time increases quadratically as this number increases, but this number also should be high enough to separate different sample sites otherwise they will be binned together as a single site.}

  \item{RhoParameter}{This is a real precision parameter weighting the amount of smoothing in the alllele frequency surface.  A higher value flattens out the surface while a lower value allows for more fluctuations.  The default value of 10 was used in our analysis and should prove a good starting point.  To choose a value by crossvalidation please see \code{\link{FindRhoParameterCrossValidation}}}
  
  \item{LambdaParameter}{This is a real precision parameter weighting the admixture fractions algorithm.  For the most part, this does not need to be changed as it seems to only affect the time to convergence.}
  
  \item{MaskWater}{Logical value that if true removes water from the plotted regions.}
 
}

\value{
	%This outputs a plot of the allele frequency surface on a map.
List with the following components:
%\item{AlleleFrequencySurfaces}{An array giving the allele frequency for each coordinate and each SNP.  The dimension of this array is [NumberSNPs,NumberLongitudeDivisions,NumberLatitudeDivisions], where either NumberLongitudeDivisions or NumberLatitudeDivisions is equal to MaxGridLength(an input to this function) and the other is scaled so that the geodesic distance between points horizontally and vertically is equal.}

%\item{UnknownGrids}{An array giving the probability that an unknown individual comes from the given location.  The dimension of this array is [NumberLongitudeDivisions,NumberLatitudeDivisions,NumberUnknowns], where either NumberLongitudeDivisions or NumberLatitudeDivisions is equal to MaxGridLength(an input to this function) and the other is scaled so that the geodesic distance between points horizontally and vertically is equal.}

\item{AdmixtureFractions}{An array giving the admixture fraction from the given location.  In other words this is the fractional contribution of the location to the unknown individuals genetic data.  The dimension of this array is [NumberLongitudeDivisions, NumberLatitudeDivisions, NumberUnknowns], where either NumberLongitudeDivisions or NumberLatitudeDivisions is equal to MaxGridLength(an input to this function) and the other is scaled so that the geodesic distance between points horizontally and vertically is equal.}

\item{DataArray}{An array giving the number of major/minor SNPs (defined as the most occuring in the dataset) grouped by sample sites for each SNP.  The dimension of this array is [2, SampleSites, NumberSNPs].}

\item{NumberSNPs}{This shows the integer number of SNPs found.}

\item{GridLength}{An array giving the number of longitudinal and latitudinal divisions.  The dimension of this array is [2], where the first number is longitude and the second is latitude.}

\item{RhoParameter}{A real value showing the inputted RhoParameter value.}

\item{SampleSites}{This shows the integer number of sample sites found.}

\item{MaxGridLength}{An integer giving the maximum number of boxes to fill the longer side of the region.  Note that computation time increases quadratically as this number increases, but this number also should be high enough to separate different sample sites otherwise they will be binned together as a single site.  This number was part of the inputs.}

\item{SampleCoordinates}{This is an array which gives the longitude and latitude of each of the found sample sites.  The dimension of this array is [SampleSites,2], where the second dimension represents longitude and latitude respectively.}

\item{GridCoordinates}{An array showing the corresponding coordinates for each longitude and latitude division.  The dimension of this array is [2,MaxGridLength], with longitude coordinates coming first and latitude second.  Note that one of these rows may not be filled entirely.  The associated output GridLength should be used to find the lengths of the two rows.  Rows not filled in entirely will contain zeroes at the end.}

%\item{PlinkFileName}{This shows the inputted PlinkFileName with ".ped" attached.}

%\item{LocationFile}{This shows the inputted LocationFileName.}

%\item{UnknownPEDFile}{This shows the inputted PED file for the unknown individuals.}

\item{NumberUnknowns}{This is an integer value showing the number of unknowns found in the UnknownPEDFile.}

\item{UnknownData}{An array showing the unknown individuals genetic data.  The dimension of this array is [NumberUnknowns,NumberSNPs].}

%\item{Membership}{This is an integer valued vector showing the group number of each member of the inputted known group.  The dimension of this array is [NumberKnown].}

%\item{NumberKnown}{This is an integer value showing the number of known found in the PlinkFileName.}

%\item{Rankings}{An integer valued vector giving the LRT based ranking of each SNP.  This can be used to reduce the number of SNPs to use for assignment if analysis takes too long.}

%\item{LRT}{This is a real valued array giving the Likelihood Ratio test statistic and the informativeness for assignment(Rosenberg) for each SNP.  The dimension of this array is [2,NumberSNPs].}

\item{IsLand}{This is a logical valued array that is TRUE when the given coordinates are over land and FALSE when over water.  The dimension of this array is [GridLength[1],GridLength[2]].}

}

\references{
Ranola J, Novembre J, Lange K (2014) Fast Spatial Ancestry via Flexible Allele Frequency Surfaces. Bioinformatics, in press.

}

\author{
John Michael Ranola, John Novembre, and Kenneth Lange
}

\seealso{
%\code{\link{ConvertPEDData}} for converting Plink PED files into a format appropriate for analysis,

%\code{\link{FitOriGenModel}} for fitting allele surfaces to the converted data,

%\code{\link{PlotAlleleFrequencySurface}} for a quick way to plot the resulting allele frequency surfaces from \code{FitOriGenModel},

\code{\link{ConvertUnknownPEDData}} for converting two Plink PED files (known and unknown)into a format appropriate for analysis,

\code{\link{FitOriGenModelFindUnknowns}} for fitting allele surfaces to the converted data and finding the locations of the given unknown individuals,

\code{\link{PlotUnknownHeatMap}} for a quick way to plot the resulting unknown heat map surfaces from \code{FitOriGenModelFindUnknowns},;

\code{\link{FitAdmixedModelFindUnknowns}} for fitting allele surfaces to the converted data and finding the locations of the given unknown individuals who may be admixed,

\code{\link{PlotAdmixedSurface}} for a quick way to plot the resulting admixture surfaces from \code{FitAdmixedFindUnknowns},

%\code{\link{RankSNPsLRT}} for reducing the number of SNPs using a likelihood ratio test criteria or informativeness for assignment,

%\code{\link{FindRhoParamterCrossValidation}} for choosing an appropriate Rho parameter by way of crossvalidation,

}

\examples{

#this example not run because it takes longer than 5 secs
#note - type example(FunctionName, run.dontrun=TRUE) to run the example where FunctionName is
#the name of the function
\dontrun{

	#Data generation
	SampleSites=10
	NumberSNPs=4
	TestData=array(sample(2*(1:30),2*SampleSites*NumberSNPs,replace=TRUE),
		dim=c(2,SampleSites,NumberSNPs))
	#Europe is about -9 to 38 and 34 to 60
	TestCoordinates=array(0,dim=c(SampleSites,2))
	TestCoordinates[,1]=runif(SampleSites,-9,38)
	TestCoordinates[,2]=runif(SampleSites,34,60)

	#This code simulates the number of major alleles the unknown individuals have.
	NumberUnknowns=2
	TestUnknowns=array(sample(0:2,NumberUnknowns*NumberSNPs,replace=TRUE),
		dim=c(NumberUnknowns,NumberSNPs))

	#Fitting the admixed model
	#MaxGridLength is the maximum number of boxes allowed to span the region in either direction
	#Note that MaxGridLength is reduced here to allow the example to run in less than 5 secs
	#RhoParameter is a tuning constant
	print("MaxGridLength is intentionally set really low for fast examples.
		Meaningful results will most likely require a higher value.")
	trials6=FitAdmixedModelFindUnknowns(TestData,TestCoordinates,
		TestUnknowns,MaxGridLength=8,RhoParameter=10)

	#Plots the admixed surface disregarding fractions less than 0.01
	PlotAdmixedSurface(trials6)
	}
}


\keyword{Localization}% __ONLY ONE__ keyword per line
\keyword{Ancestry}% __ONLY ONE__ keyword per line
\keyword{Admixture}% __ONLY ONE__ keyword per line
