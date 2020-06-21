import 'package:flutter/material.dart';
import 'package:ummense_app/src/models/organization_model.dart';
import 'package:ummense_app/src/models/u_app_model.dart';
import 'package:ummense_app/src/resources/organization/organization_info.dart';
import 'package:ummense_app/src/theme/theme_colors.dart';
import 'package:ummense_app/src/theme/theme_text.dart';
import 'package:ummense_app/src/widgets/images/organization_logo.dart';

class OrganizationListInfo extends StatelessWidget {
  const OrganizationListInfo({this.mediaQuery});

  final MediaQueryData mediaQuery;

  @override
  Widget build(BuildContext context) {
    const OrganizationModel organization = OrganizationModel();
    const UAppModel uApp = UAppModel();

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.only(bottom: mediaQuery.size.height * 0.1),
            decoration: const BoxDecoration(
              color: ThemeColors.GREY_LIGHT_4,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              )
            ),
            child: Column(
              children: <Widget>[
                Container(
                  child: ListTile(
                    leading: const OrganizationLogo(),
                    title: Text(
                      organization.name,
                      style: TextStyle(
                        fontSize: ThemeText.FONT_SIZE_MEDIUM,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    subtitle: Text(
                      organization.slogan,
                      style: TextStyle(
                        fontSize: ThemeText.FONT_SIZE_SMALL,
                        color: ThemeColors.GREY_LIGHT_2
                      ),
                    ),
                  ),
                ),
                const Divider(color: ThemeColors.GREY_LIGHT_2),

                if ( uApp != null && uApp.description.isNotEmpty )
                OrganizationInfo(showDivider: true, title: 'Descrição', subtitle: uApp.description),

                if ( organization.phone != null && organization.phone.isNotEmpty )
                OrganizationInfo(showDivider: true, title: 'Celular', subtitle: organization.phone),

                if ( organization.email != null && organization.email.isNotEmpty )
                OrganizationInfo(showDivider: true, title: 'E-mail', subtitle: organization.email),

                if ( organization.website != null && organization.website.isNotEmpty )
                OrganizationInfo(showDivider: true, title: 'Site', subtitle: organization.website),

                // const OrganizationInfo(showDivider: false, title: 'Endereço'),
                // Container(
                //   padding: EdgeInsets.symmetric(
                //     horizontal: mediaQuery.size.width * 0.05
                //   ),
                //   child: const Image(
                //     image: AssetImage('assets/images/temp/Maps.png'),
                //   )
                // ),
              ],
            ),
          );
        },
        childCount: 1
      ),
    );
  }
}