/* 
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU Lesser General Public License as published
 * by the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

namespace GICR {

	/**
	 * A privilege represents the capability of performing a particular set of
	 * operations on items in the JCR repository. 
	 *
	 * Each privilege is identified by a
	 * JCR name. JCR defines a set of standard privileges in the jcr namespace.
	 * Implementations may add additional privileges in namespaces other than jcr.
	 *
	 * A privilege may be an aggregate privilege. Aggregate privileges are sets of
	 * other privileges. Granting, denying, or testing an aggregate privilege is
	 * equivalent to individually granting, denying, or testing each privilege it
	 * contains. The privileges contained by an aggregate privilege may themselves
	 * be aggregate privileges if the resulting privilege graph is acyclic.
	 *
	 * A privilege may be an abstract privilege. Abstract privileges cannot themselves
	 * be granted or denied, but can be composed into aggregate privileges which are
	 * granted or denied.
	 *
	 * A privilege can be both aggregate and abstract.
	 */
	public interface Privilege : Object {

		/**
		 * A constant representing jcr:read (in extended form), the privilege to retrieve
		 * a node and get its properties and their values.
		 */
		public const string JCR_READ = "{http://www.jcp.org/jcr/1.0}read";

		/**
		 * A constant representing jcr:modifyProperties (in extended form), the privilege
		 * to create, modify and remove the properties of a node.
		 */
		public const string JCR_MODIFY_PROPERTIES = "{http://www.jcp.org/jcr/1.0}modifyProperties";

		/**
		 * A constant representing jcr:addChildNodes (in extended form), the privilege
		 * to create child nodes of a node.
		 */
		public const string JCR_ADD_CHILD_NODES = "{http://www.jcp.org/jcr/1.0}addChildNodes";

		/**
		 * A constant representing jcr:removeNode (in extended form), the privilege
		 * to remove a node.
		 *
		 * In order to actually remove a node requires jcr:removeNode on that node
		 * and jcr:removeChildNodes on the parent node.
		 *
		 * The distinction is provided in order to reflect implementations that internally model "remove"
		 * as a "delete" instead of a "unlink". A repository that uses the "delete" model
		 * can have jcr:removeChildNodes in every access control policy, so that removal
		 * is effectively controlled by jcr:removeNode.
		 */
		public const string JCR_REMOVE_NODE = "{http://www.jcp.org/jcr/1.0}removeNode";

		/**
		 * A constant representing jcr:removeChildNodes (in extended form), the privilege
		 * to remove child nodes of a node. In order to actually remove a node requires jcr:removeNode on that node
		 * and jcr:removeChildNodes on the parent node.
		 *
		 * The distinction is provided in order to reflect implementations that internally model "remove"
		 * as a "unlink" instead of a "delete". A repository that uses the "unlink" model
		 * can have jcr:removeNode in every access control policy, so that removal
		 * is effectively controlled by jcr:removeChildNodes.
		 */
		public const string JCR_REMOVE_CHILD_NODES = "{http://www.jcp.org/jcr/1.0}removeChildNodes";

		/**
		 * A constant representing jcr:write (in extended form), an aggregate privilege that contains:
		 * * jcr:modifyProperties
		 * * jcr:addChildNodes
		 * * jcr:removeNode
		 * * jcr:removeChildNodes
		 */
		public const string JCR_WRITE = "{http://www.jcp.org/jcr/1.0}write";

		/**
		 * A constant representing jcr:readAccessControl (in extended form), the privilege
		 * to get the access control policy of a node.
		 */
		public const string JCR_READ_ACCESS_CONTROL = "{http://www.jcp.org/jcr/1.0}readAccessControl";

		/**
		 * A constant representing jcr:modifyAccessControl (in extended form), the privilege
		 * to modify the access control policies of a node.
		 */
		public const string JCR_MODIFY_ACCESS_CONTROL = "{http://www.jcp.org/jcr/1.0}modifyAccessControl";

		/**
		 * A constant representing jcr:lockManagement (in extended form), the
		 * privilege to lock and unlock a node.
		 */
		public const string JCR_LOCK_MANAGEMENT = "{http://www.jcp.org/jcr/1.0}lockManagement";

		/**
		 * A constant representing jcr:versionManagment (in extended form), the
		 * privilege to perform versioning operations on a node.
		 */
		public const string JCR_VERSION_MANAGEMENT = "{http://www.jcp.org/jcr/1.0}versionManagement";

		/**
		 * A constant representing jcr:nodeTypeManagement (in extended form), the
		 * privilege to add and remove mixin node types and change the primary node
		 * type of a node.
		 */
		public const string JCR_NODE_TYPE_MANAGEMENT = "{http://www.jcp.org/jcr/1.0}nodeTypeManagement";

		/**
		 * A constant representing jcr:retentionManagement (in extended form), the
		 * privilege to perform retention management operations on a node.
		 */
		public const string JCR_RETENTION_MANAGEMENT = "{http://www.jcp.org/jcr/1.0}retentionManagement";

		/**
		 * A constant representing jcr:lifecycleManagement (in extended form), the
		 * privilege to perform lifecycle operations on a node.
		 */
		public const string JCR_LIFECYCLE_MANAGEMENT = "{http://www.jcp.org/jcr/1.0}lifecycleManagement";

		/**
		 * A constant representing jcr:all (in extended form), an aggregate privilege that contains
		 * all predefined privileges.
		 * * jcr:read
		 * * jcr:write
		 * * jcr:readAccessControl
		 * * jcr:modifyAccessControl
		 * * jcr:lockManagement
		 * * jcr:versionManagement
		 * * jcr:nodeTypeManagement
		 * * jcr:retentionManagement
		 * * jcr:lifecycleManagement
		 *
		 * It should, in addition, include all implementation-defined privileges.
		 */
		public const string JCR_ALL = "{http://www.jcp.org/jcr/1.0}all";

		/**
		 * Returns the name of this privilege.
		 *
		 * @return the name of this privilege.
		 */
		public abstract string get_name ();

		/**
		 * Returns whether this privilege is an abstract privilege.
		 *
		 * @return true if this privilege is an abstract privilege; false otherwise.
		 */
		public abstract bool is_abstract ();

		/**
		 * Returns whether this privilege is an aggregate privilege.
		 *
		 * @return true if this privilege is an aggregate privilege; false otherwise.
		 */
		public abstract bool is_aggregate ();

		/**
		 * If this privilege is an aggregate privilege, returns the privileges
		 * directly contained by the aggregate privilege. Otherwise returns an empty
		 * array.
		 *
		 * @return an array of Privileges
		 */
		public abstract Privilege[] get_declared_aggregate_privileges ();

		/**
		 * If this privilege is an aggregate privilege, returns the privileges it
		 * contains, the privileges contained by any aggregate privileges among those,
		 * and so on (the transitive closure of privileges contained by this
		 * privilege). Otherwise returns an empty array.
		 *
		 * @return an array of Privileges
		 */
		public abstract Privilege[] get_aggregate_privileges ();
		}
}
