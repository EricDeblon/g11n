#!/usr/bin/perl
#
# CDDL HEADER START
#
# The contents of this file are subject to the terms of the
# Common Development and Distribution License (the "License").  
# You may not use this file except in compliance with the License.
#
# You can obtain a copy of the license at src/OPENSOLARIS.LICENSE
# or http://www.opensolaris.org/os/licensing.
# See the License for the specific language governing permissions
# and limitations under the License.
#
# When distributing Covered Code, include this CDDL HEADER in each
# file and include the License file at src/OPENSOLARIS.LICENSE.
# If applicable, add the following below this CDDL HEADER, with the
# fields enclosed by brackets "[]" replaced with your own identifying
# information: Portions Copyright [yyyy] [name of copyright owner]
#
# CDDL HEADER END
#
#
# Copyright 2006 Sun Microsystems, Inc.  All rights reserved.
# Use is subject to license terms.
#

# Create hash that map all locales to their regions

%region = ();
$region{'en_AU'} = 'aua';
$region{'en_NZ'} = 'aua';
$region{'es_CR'} = 'cam';   
$region{'es_GT'} = 'cam';
$region{'es_NI'} = 'cam';
$region{'es_PA'} = 'cam';
$region{'es_SV'} = 'cam';
$region{'es1'} = 'cam';
$region{'cs_CZ'} = 'ceu';
$region{'de_AT'} = 'ceu';
$region{'de_CH'} = 'ceu';
$region{'de_DE'} = 'ceu';
$region{'fr_CH'} = 'ceu';
$region{'hu_HU'} = 'ceu';
$region{'pl_PL'} = 'ceu';
$region{'sk_SK'} = 'ceu';
$region{'de1'} = 'ceu';
$region{'fr1'} = 'ceu';
$region{'bg_BG'} = 'eeu';
$region{'et_EE'} = 'eeu';
$region{'hr_HR'} = 'eeu';
$region{'lt_LT'} = 'eeu';
$region{'lv_LV'} = 'eeu';
$region{'mk_MK'} = 'eeu';
$region{'ro_RO'} = 'eeu';
$region{'ru_RU'} = 'eeu';
$region{'sh_BA'} = 'eeu';
$region{'sl_SI'} = 'eeu';
$region{'sq_AL'} = 'eeu';
$region{'sr_CS'} = 'eeu';
$region{'sr_SP'} = 'eeu';
$region{'sr_YU'} = 'eeu';
$region{'tr_TR'} = 'eeu';
$region{'hi_IN.UTF-8'} = 'hi_in';
$region{'ja'} = 'ja';
$region{'ja_JP.PCK'} = 'ja';
$region{'ja_JP.UTF-8'} = 'ja';
$region{'ko'} = 'korean';
$region{'ko_KR'} = 'korean';
$region{'ko.UTF-8'} = 'korean';
$region{'he_IL'} = 'mea';
$region{'he'} = 'mea';
$region{'ar_SA'} = 'mea';
$region{'ar_EG'} = 'naf';
$region{'ar'} = 'naf';
$region{'en_CA'} = 'nam';
$region{'en_US'} = 'nam';
$region{'es_MX'} = 'nam';
$region{'fr_CA'} = 'nam';
$region{'en_US.UTF-8'} = 'nam';
$region{'es2'} = 'nam';
$region{'fr2'} = 'nam';
$region{'da_DK'} = 'neu';
$region{'fi_FI'} = 'neu';
$region{'is_IS'} = 'neu';
$region{'nb_NO'} = 'neu';
$region{'nn_NO'} = 'neu';
$region{'no_NO'} = 'neu';
$region{'sv_SE'} = 'neu';
$region{'sv'} = 'neu';
$region{'es_AR'} = 'sam';
$region{'es_BO'} = 'sam';
$region{'es_CL'} = 'sam';
$region{'es_CO'} = 'sam';
$region{'es_EC'} = 'sam';
$region{'es_PE'} = 'sam';
$region{'es_PY'} = 'sam';
$region{'es_UY'} = 'sam';
$region{'es_VE'} = 'sam';
$region{'pt_BR'} = 'sam';
$region{'es3'} = 'sam';
$region{'ca_ES'} = 'seu';
$region{'el_CY'} = 'seu';
$region{'el_GR'} = 'seu';
$region{'en_MT'} = 'seu';
$region{'es_ES'} = 'seu';
$region{'it_IT'} = 'seu';
$region{'mt_MT'} = 'seu';
$region{'pt_PT'} = 'seu';
$region{'it'} = 'seu';
$region{'es4'} = 'seu';
$region{'th_th'} = 'th_th';
$region{'th_TH'} = 'th_th';
$region{'th_TH.UTF-8'} = 'th_th';
$region{'de_LU'} = 'weu';
$region{'en_GB'} = 'weu';
$region{'en_IE'} = 'weu';
$region{'fr_BE'} = 'weu';
$region{'fr_FR'} = 'weu';
$region{'fr_LU'} = 'weu';
$region{'nl_BE'} = 'weu';
$region{'nl_NL'} = 'weu';
$region{'fr3'} = 'weu';
$region{'de2'} = 'weu';
$region{'zh_cn'} = 'china';
$region{'zh_CN'} = 'china';
$region{'zh'} = 'china';
$region{'zh_CN.GB18030'} = 'china';
$region{'zh.GBK'} = 'china';
$region{'zh.UTF-8'} = 'china';
$region{'zh_hk'} = 'hongkong';
$region{'zh_HK.BIG5HK'} = 'hongkong';
$region{'zh_HK.UTF-8'} = 'hongkong';
$region{'zh_tw'} = 'taiwan';
$region{'zh_TW.BIG5'} = 'taiwan';
$region{'zh_TW'} = 'taiwan';
$region{'zh_TW.UTF-8'} = 'taiwan';

#retrieve configfile name

$versionname = $ARGV[0];
chomp $versionname;

# Define number of regional occurences of es and fr locales

$numOfES = 4;
$numOfFR = 3;
$numOfDE = 2;

# Create an array to temporarily store region values on

@Regionarray;

# Retrieve the solaris combined image

$path = $ARGV[1];
chomp $path;

# Repeat input prompt to user while the path is not valid

while (!chdir($path)) {
	print "\n $path not found: Please insert image and enter path: ";
	$path = <STDIN>;
	chomp $path;		
}

# Change to the directory of the path

chdir($path);


# Change to the path directory

chdir($path);

# Create the Temp File to write region data into to.

open (TEMPFILE, "> $versionname.tmp") or die ("Couldn't open $versionname.tmp");

# open an inputstream that searches for files of type pkginfo
                                                                                        
open (LS, "find . -name \"pkginfo\" |");

while (<LS>) {

      	# Open each pkginfo file
   	open (PKGINFO, $_);

  	while (<PKGINFO>) {

	chomp $_;

	# Retrieve the full package name from the PKG= entry in file

	if (/(PKG=SUNW)/) {
		$package = substr($_, 4);
	}

	# Retrieve all locales if associated with PKG, and split them if there
	# are multiple locales available

        if (/SUNW_LOC=/) {
		$Alllocales = substr($_, 9);
		@locales = split(/,/, $Alllocales); 

		# Add each occurence of pkg, region and locale to @Regionarray 

		for $locale (@locales) {

			# Push all occurences of es in different regions onto @Regionarray
			# es is in 4 regions, all of which can be referenced in %region hash
			# using the appropriate number

			if($locale eq "es") {
			
			     	for($i=1;$i<=$numOfES;$i++) {

					$eslocale = $locale.$i;                                  						
					# Push the region entry onto the array
					push(@Regionarray, "$package\t$region{$eslocale}\n");

			    	}	

			}

                        # Push all occurences of es in different regions onto @Regionarray
                        # de is in 2 regions, all of which can be referenced in %region hash
                        # using the appropriate number

                        if($locale eq "de") {

                                for($i=1;$i<=$numOfDE;$i++) {

                                        $delocale = $locale.$i;
                                        # Push the region entry onto the array
                                        push(@Regionarray, "$package\t$region{$delocale}\n");

                                }

                        }

			# Push all occurences of fr in different regions onto @Regionarray
			# fr is in 3 regions, all of which can be referenced in %region hash
			# using the appropriate number

			elsif($locale eq "fr") {
			
			     	for($j=1;$j<=$numOfFR;$j++) {

					$frlocale = $locale.$j;  
                                
					# Push the region entry onto the array
					push(@Regionarray, "$package\t$region{$frlocale}\n");

			    	}	

			}

			# Push all occurences of every other locale onto @Regionarray

			else {

				# Push the region entry onto the array
				push(@Regionarray, "$package\t$region{$locale}\n");

				
			}

		}

	}
   }
}

# Close inputstream

close (LS);

print "\nFinished searching install image $path\n";

# Open the origional config file $versioname.old, and use its image names to assign values
# for the image for each of our entries

open (ORIG, "$versionname.old") or die ("Couldn't open $versionname.old");
@origpackages = <ORIG>;

foreach $origline (@origpackages) {

chomp $origline;
$origline =~ /^([\w-]+)\s+([\w-]+)\s+([\w-]+)/;

# The original package name
$origname = $1;

# The original region
$origregion = $2;

# The original image
$origimage = $3;

chomp $origname;
chomp $origregion;
chomp $origimage;


	foreach $regionline (@Regionarray) {
	$regionline =~ /^([\w-]+)\s+([\w-]+)/;

	# Our current package name in @Regionarray
	$regionname = $1;

	# Our current  region in @Regionarray
	$regionregion = $2;
	
		# If the origional Package name and region match our current 
		# package name and region, insert the origional image name into
		# the array line

		if($regionname eq $origname && $regionregion eq $origregion) {

			$regionline = "$regionname\t$regionregion\t$origimage\n";
		}
	}

}

# For all lines remaining in @Regionarray, give them the value
# langcd1 so that localadmin will search for them in the combined 
# image 

foreach $arrayline (@Regionarray) {
	
	# If there is no image entered on the array line

	if (!($arrayline =~ /([\w-]+)\s+(\w+)\s+(\w.*)/)) {
		$arrayline =~ /([\w-]+)\s+([-\w]+)/;	

		# The current package name in @Regionarray
		$arrayname = $1;

		# The current region name in @Regionarray
		$arrayregion = $2;

		chomp $arrayname;
		chomp $arrayregion;

		# Array line is assigned image langcd1
		$arrayline = "$arrayname\t$arrayregion\tlangcd1\n";
	}
}

# Change the values of french packages in ceu and nam, and change cd assigned from
# langcd1 to langcd2 to allow localeadmin to pick them up on the second pass.
# This is also perform on italian packages in seu.

foreach $line (@Regionarray) {
	if ($line =~ /SUNWf\w*/ && $line =~ /\sceu\s/ && $line =~ s/langcd1/langcd2/) {
	}
	elsif ($line =~ /SUNWgnome-l10n\w*-fr/ && $line =~ /\sceu\s/ && $line =~ s/langcd1/langcd2/) {
	}
	elsif ($line =~ /SUNWf\w*/ && $line =~ /\snam\s/ && $line =~ s/langcd1/langcd2/) {
	}
	elsif ($line =~ /SUNWgnome-l10n\w*-fr/ && $line =~ /\snam\s/ && $line =~ s/langcd1/langcd2/) {
	}
	elsif ($line =~ /SUNWd\w*/ && $line =~ /\sweu\s/ && $line =~ s/langcd1/langcd2/) {
        }
	elsif ($line =~ /SUNWi\w*/ && $line =~ /\sseu\s/ && $line =~ s/langcd1/langcd2/) {
	}
	elsif ($line =~ /SUNWgnome-l10n\w*-it/ && $line =~ /\sseu\s/ && $line =~ s/langcd1/langcd2/) {
	}
	elsif ($line =~ /SUNWgnome-l10n\w*-de/ && $line =~ /\sweu\s/ && $line =~ s/langcd1/langcd2/) {
        }
}

# Sort the array of regions, first sorted aplhabetically, then sort by region
# Result is array of region entries, sorted by region, and each regions entries
# are sorted alphabetically 

@Regionarray = sort(@Regionarray);
@Regionarray = map {$_->[0]}
	sort { $a->[1] cmp $b->[1] }
	map {[$_,/(\s+\w+)/, uc($_)]} @Regionarray;


# Remove duplicate lines in array and print into TEMPFILE

$previousline = '';
foreach $line (@Regionarray) {

next if $line eq $lastline;
print TEMPFILE $line;
$lastline = $line;
}

close (TEMPFILE);
