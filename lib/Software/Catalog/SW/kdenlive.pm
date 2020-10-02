package Software::Catalog::SW::kdenlive;

# AUTHORITY
# DATE
# DIST
# VERSION

use 5.010001;
use strict;
use warnings;

use PerlX::Maybe;

use Role::Tiny::With;
with 'Versioning::Scheme::Dotted';
with 'Software::Catalog::Role::Software';

use Software::Catalog::Util qw(extract_from_url);

sub archive_info { [412, "Download URL is not archive"] }

sub available_versions { [501, "Not implemented"] }

sub canon2native_arch_map {
    return +{
        'linux-x86_64' => 'x86_64',
        'win64' => 'win',
    },
}

sub homepage_url { "https://kdenlive.org/" }

sub download_url {
    my ($self, %args) = @_;

    # https://files.kde.org/kdenlive/release/kdenlive-20.08.1-x86_64.appimage
    # https://files.kde.org/kdenlive/release/kdenlive-20.08.1.exe

    [200, "OK", "https://files.kde.org/kdenlive/release/kdenlive-$args{version}" . ($args{arch} =~ /win/ ? ".exe" : "-x86_64.appimage"), {
    }];
}

sub is_dedicated_profile { 0 }

sub latest_version {
    my ($self, %args) = @_;

    extract_from_url(
        url => "https://kdenlive.org/en/download/",
        re  => qr{\Qhttps://files.kde.org/kdenlive/release/kdenlive-\E(\d+(?:\.\d+)*)\Q-x86_64.appimage\E},
    );
}

sub release_note { [501, "Not implemented"] }

1;
# ABSTRACT: KDEnlive

=for Pod::Coverage ^(.+)$
