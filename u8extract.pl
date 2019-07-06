#!/usr/bin/perl
# 
# Filename: u8extract.pl
#
# Desc: 
#	Used to extract files from Wii U8 archives.
# Last updated: 
#	08/14/2008
# Usage: 
#	u8archive.pl archivename
# Note: 
#	Creates "u8out" directory for output.
#
# - FyberOptic
# http://www.fybertech.com
#


my $u8filename = $ARGV[0];

if (!length($u8filename) || !-e $u8filename) { print "Please specify a U8 archive to extract\n"; exit; }

# Open archive
open(U8FILE, $u8filename);
binmode(u8FILE);

#struct U8_archive_header
#{
#  u32 tag; // 0x55AA382D "U.8-"
#  u32 rootnode_offset; // offset to root_node, always 0x20.
#  u32 header_size; // size of header from root_node to end of string table.
#  u32 data_offset; // offset to data -- this is rootnode_offset + header_size, aligned to 0x40.
#  u8 zeroes[16];
#};

my $filedata;

# Read archive header
read(U8FILE, $filedata, 16);
my ($header_tag,$rootname_offset,$header_size,$data_offset) = unpack("N N N N",$filedata);

# Check for U8 header tag
if ($header_tag != 0x55AA382D) { print "Invalid U8 archive\n"; exit; }

#print "HEADER: $header_tag $rootname_offset $header_size $data_offset\n";

#Read 16 unknown bytes
read(U8FILE, $filedata, 16);


#struct U8_node 
#{
#  u16 type;
#  u16 name_offset;
#  u32 data_offset;
#  u32 size;
#};


# Read first node
read(U8FILE, $filedata, 12);
my ($node_type, $node_nameoffset, $node_dataoffset, $node_size) = unpack("n n N N",$filedata);

#print "FIRST NODE: $node_type, $node_nameoffset, $node_dataoffset, $node_size\n";

# Number of nodes = First node's size
my $totalnodes = $node_size;

# Used to store remaining nodes' hash tables
my @nodes;

# Read nodes (minus one, since we read one already)
for ($n = 0; $n < $totalnodes-1; $n++)
{
	read(U8FILE, $filedata, 12);	
	my ($node_type, $node_nameoffset, $node_dataoffset, $node_size) = unpack("n n N N",$filedata);
	#print "NODE $n: $node_type, $node_nameoffset, $node_dataoffset, $node_size\n";
	
	my %currentnode = ('type',$node_type,'nameoffset',$node_nameoffset,'dataoffset',$node_dataoffset, 'size',$node_size);
	push @nodes,\%currentnode;
}

#print "STRINGS SIZE: " . ($header_size - tell(U8FILE) + 32) . "\n";

# Read string table
my $stringtabledata;
read(U8FILE, $stringtabledata, $header_size - tell(U8FILE) + 32);

# Split string table into array
my @stringtable = split("\0",$stringtabledata);

# Create directory to store output files
mkdir("u8out");

# Extract files
foreach (0..@nodes-1)
{
	my %thisnode = %{$nodes[$_]};
	#print "NODE $_: $thisnode{type}, $thisnode{nameoffset}, $thisnode{dataoffset}, $thisnode{size}\n";
	#print "FILENAME: $stringtable[$_+1]\n\n";
	if ($thisnode{'type'} != 0) { next; }
	
	print "Extracting $stringtable[$_+1]...\n";
	
	my $filebuffer;
	seek(U8FILE, $thisnode{'dataoffset'}, 0);
	read(U8FILE, $filebuffer, $thisnode{'size'});	
	
	open(OUTFILE, "> u8out/$stringtable[$_+1]");
	binmode(OUTFILE);
	print OUTFILE $filebuffer;
	close(OUTFILE);
}

close(U8FILE);
