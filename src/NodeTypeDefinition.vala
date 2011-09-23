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
 	 * The NodeTypeDefinition interface provides methods for discovering the
	 * static definition of a node type. These are accessible both before and
	 * after the node type is registered. Its subclass NodeType adds methods
	 * that are relevant only when the node type is "live"; that is, after it
	 * has been registered. Note that the separate NodeDefinition interface only
	 * plays a significant role in implementations that support node type
	 * registration. In those cases it serves as the superclass of both NodeType
	 * and {@link NodeTypeTemplate}. In implementations that do not support node type
	 * registration, only objects implementing the subinterface NodeType will
	 * be encountered.
	 */
	public interface NodeTypeDefinition : Object {

		/**
		 * Returns the name of the node type.
		 *
		 * In implementations that support node type registration, if this
		 * NodeTypeDefinition object is actually a newly-created empty
		 * {@link NodeTypeTemplate}, then this method will return null.
		 *
		 * @return The name of the node type.
		 */
		public abstract string get_name ();

		/**
		 * Returns the names of the supertypes actually declared in this node type.
		 *
		 * In implementations that support node type registration, if this
		 * NodeTypeDefinition object is actually a newly-created empty
		 * {@link NodeTypeTemplate}, then this method will return an array containing a
		 * single string indicating the node type nt:base.
		 *
		 * @return List of names of declared supertypes.
		 */
		public abstract string[] get_declared_supertype_names ();

		/**
		 * Reports if this is an abstract node type.
		 *
		 * Returns true if this is an abstract node type; returns false otherwise.
		 * An abstract node type is one that cannot be assigned as the primary or
		 * mixin type of a node but can be used in the definitions of other node
		 * types as a superclass.
		 *
		 * In implementations that support node type registration, if this
		 * NodeTypeDefinition object is actually a newly-created empty
		 * {@link NodeTypeTemplate}, then this method will return false.
		 *
		 * @return True, if the current type is abstract, else false.
		 */
		public abstract bool is_abstract ();

		/**
		 * Reports if this is a mixin node type.
		 *
		 * Returns true if this is a mixin type; returns false if it is primary.
		 * In implementations that support node type registration, if this
		 * NodeTypeDefinition object is actually a newly-created empty
		 * {@link NodeTypeTemplate}, then this method will return false.
		 *
		 * @return True if this is a mixin type, else false;
		 */
		public abstract bool is_mixin ();

		/**
		 * Determines if nodes of this type must support orderable child nodes.
		 *
		 * Returns true if nodes of this type must support orderable child nodes;
		 * returns false otherwise. If a node type returns true on a call to this
		 * method, then all nodes of that node type must support the method
		 * Node.order_before(). If a node type returns false on a call to this method,
		 * then nodes of that node type may support Node.order_before(). Only the primary
		 * node type of a node controls that node's status in this regard. This setting
		 * on a mixin node type will not have any effect on the node.
		 * In implementations that support node type registration, if this
		 * NodeTypeDefinition object is actually a newly-created empty
		 * {@link NodeTypeTemplate}, then this method will return false.
		 *
		 * @return True, if nodes of this type must support orderable child nodes, else false.
		 */
		public abstract bool has_orderable_child_nodes ();

		/**
		 * Determins if the node type is queryable.
		 *
		 * Returns true if the node type is queryable, meaning that the
		 * available-query-operators, full-text-searchable and query-orderable
		 * attributes of its property definitions take effect.
		 *
		 * If a node type is declared non-queryable then these attributes of its
		 * property definitions have no effect.
		 *
		 * @return True, if the node type is queryable, else false.
		 *
		 * @see PropertyDefinition.get_available_query_operators()
		 * @see PropertyDefinition.is_full_text_searchable()
		 * @see PropertyDefinition.is_query_orderable()
		 */
		public abstract bool is_queryable ();

		/**
		 * Returns the name of the primary item (one of the child items of the nodes
		 * of this node type).
		 *
		 * If this node has no primary item, then this method
		 * returns null. This indicator is used by the method Node.get_primary_item().
		 * In implementations that support node type registration, if this
		 * NodeTypeDefinition object is actually a newly-created empty
		 * {@link NodeTypeTemplate}, then this method will return null.
		 *
		 * @return The name of the primary item.
		 */
		public abstract string get_primary_item_name ();

		/**
		 * Returns an array containing the property definitions actually declared
		 * in this node type.
		 *
		 * In implementations that support node type registration, if this
		 * NodeTypeDefinition object is actually a newly-created empty
		 * {@link NodeTypeTemplate}, then this method will return null.
		 *
		 * @return An array of {@link PropertyDefinition} objects.
		 */
		public abstract PropertyDefinition[] get_declared_property_definitions ();

		/**
		 * Returns an array containing the child node definitions actually
		 * declared in this node type.
		 *
		 * In implementations that support node type registration, if this
		 * NodeTypeDefinition object is actually a newly-created empty
		 * {@link NodeTypeTemplate}, then this method will return null.
		 *
		 * @return An array of {@link NodeDefinition} objects.
		 */
		public abstract NodeDefinition[] get_declared_child_node_definitions ();
	}
}
